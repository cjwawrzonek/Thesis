function input_file(varargin)
% Generate input text files for delayed_saccade HF_RNN
%
% Optional Inputs (use key/value pairs)

opts.InputFileName = 'DelayedSaccade'; %Filename template
opts.InputDisplaySize = [11 11]; %Size of 2d input display
opts.TargetListSize = 12; %Number of targets in 
opts.TargetTemplate = [1 .45 .2 zeros(1,opts.TargetListSize-5) .2 .45]; %Template for graded output
opts.rowCoords = [3 4 5 6 7 8 9 8 7 6 5 4]; %Row-y coordinates of target locations
opts.colCoords = [6 8 9 10 9 8 6 4 3 2 3 4]; %Col-x coordinates of target locations (must be paired in order with rowCoords
opts.ConcatType = 2; %Concatenate 2D display by columns (1) or rows (2)
opts.SampleCycles = 4; %Duration of sample period
opts.DelayCycles = [5 8];%[5 6];%[5 8]; %Duration interval of delay period
opts.CueCycles = 3; %Minimum required duration of cue period. Will be padded for trials lasting less than maximum delay
opts.TargetDelayCombProb = .4;%.5;%.25; %Probability of training on a specific target identity-delay duration combination

max_delay = max(opts.DelayCycles);
opts.maxTime = max_delay + opts.SampleCycles + opts.CueCycles;

%Process variable inputs
if mod(length(varargin), 2) ~= 0, error('Must pass key/value pairs.'); end
for i = 1:2:length(varargin),
    if ~isfield(opts, varargin{i}),close close 
        error('Unknown key passed: %s.', varargin{i});
    end
    opts.(varargin{i}) = varargin{i+1};
end



%initialize and fill 2d and transform to 1d input display structs
%2D visual input display
struct.InputDisplay2D = zeros(opts.InputDisplaySize);
ind = arrayfun(@(x,y) sub2ind([opts.InputDisplaySize opts.InputDisplaySize],x,y),opts.rowCoords,opts.colCoords);
struct.InputDisplay2D(ind) = 1:opts.TargetListSize; %Assign target id to InputDisplay2D
% figure; imagesc(struct.InputDisplay2D);
%1D visual input display
if opts.ConcatType == 1, struct.InputDisplay1D = reshape(struct.InputDisplay2D,1,[]);
else, struct.InputDisplay1D = reshape(struct.InputDisplay2D',1,[]); end



%Determine training set
struct.TrainSet = rand(opts.TargetListSize,diff(opts.DelayCycles)+1) <= opts.TargetDelayCombProb;
%Patch empty rows with one training fact
patchRows = find(~any(struct.TrainSet,2))';
patchCols = randsample(1:diff(opts.DelayCycles)+1,length(patchRows),1);
ind = arrayfun(@(x,y) sub2ind([opts.TargetListSize diff(opts.DelayCycles)+1],x,y),patchRows,patchCols);
struct.TrainSet(ind) = 1;
total_inputs = sum(sum(struct.TrainSet));
%Create testing set (generalization test)
struct.TestSet = ~struct.TrainSet;


%Create train matrices
struct.Train.Inputs = zeros(numel(find(struct.TrainSet)),opts.SampleCycles+opts.DelayCycles(2)+opts.CueCycles,length(struct.InputDisplay1D)+2);
struct.Train.Outputs = zeros(numel(find(struct.TrainSet)),opts.SampleCycles+opts.DelayCycles(2)+opts.CueCycles,opts.TargetListSize);
struct.Train.Names = {};
pos = 0;
for target=1:opts.TargetListSize,
    for delay = 1:diff(opts.DelayCycles)+1,
        if struct.TrainSet(target,delay),
            pos = pos+1;
            
            struct.Train.Names{pos} = sprintf('%d-%d',target,opts.DelayCycles(1)+delay-1);
            
            struct.Train.Inputs(pos,1:opts.SampleCycles,:) = repmat([struct.InputDisplay1D == target 1 0],opts.SampleCycles,1);
            struct.Train.Inputs(pos,opts.SampleCycles+1:opts.SampleCycles+opts.DelayCycles(1)+delay-1,:) = repmat([zeros(1,length(struct.InputDisplay1D)) 1 0],opts.DelayCycles(1)+delay-1,1);
            struct.Train.Inputs(pos,opts.SampleCycles+opts.DelayCycles(1)+delay:end,:) = repmat([zeros(1,length(struct.InputDisplay1D)) 0 1],opts.CueCycles+diff(opts.DelayCycles)+1-delay,1);
            
            struct.Train.Outputs(pos,1:opts.SampleCycles+opts.DelayCycles(1)+delay-1,:) = repmat(zeros(1,opts.TargetListSize),opts.SampleCycles+opts.DelayCycles(1)+delay-1,1);
            struct.Train.Outputs(pos,opts.SampleCycles+opts.DelayCycles(1)+delay:end,:) = repmat(circshift(opts.TargetTemplate',target-1)',opts.CueCycles+diff(opts.DelayCycles)+1-delay,1);
        end
    end
end

%,2
%Write to file
f = fopen(sprintf('%sTrain.txt',opts.InputFileName),'w');

len_input = opts.InputDisplaySize(1)*opts.InputDisplaySize(2);

fprintf(f, sprintf('%d\n',total_inputs));
fprintf(f, sprintf('%d\n',opts.SampleCycles));
fprintf(f, sprintf('%d\n',len_input));
% fprintf(f, sprintf('%d\n',min(opts.DelayCycles)));
fprintf(f, sprintf('%d\n',max(opts.DelayCycles)));
fprintf(f, sprintf('%d\n',opts.CueCycles));
fprintf(f, sprintf('%d\n',opts.TargetListSize));

for comb=1:numel(find(struct.TrainSet)),
    fprintf(f,sprintf('input-%s\n',struct.Train.Names{comb}));
    for cycle=1:opts.SampleCycles+opts.DelayCycles(2)+opts.CueCycles,
        for unit=1:length(struct.InputDisplay1D)+2,
            fprintf(f,'%.2f',struct.Train.Inputs(comb,cycle,unit));
            if unit ~= length(struct.InputDisplay1D)+2, fprintf(f,' '); end
        end
        fprintf(f,'\n');
    end
    fprintf(f, 'end\n');
    fprintf(f,sprintf('output-%s\n',struct.Train.Names{comb}));
    for cycle=1:opts.SampleCycles+opts.DelayCycles(2)+opts.CueCycles,
        for unit=1:opts.TargetListSize,
            fprintf(f,'%.2f',struct.Train.Outputs(comb,cycle,unit));
            if unit ~= length(struct.InputDisplay1D)+2, fprintf(f,' '); end
        end
        fprintf(f,'\n');
    end
    fprintf(f,'end\n');
end
fclose(f);

%Create test matrices
struct.Test.Inputs = zeros(numel(find(struct.TestSet)),opts.SampleCycles+opts.DelayCycles(2)+opts.CueCycles,length(struct.InputDisplay1D)+2);
struct.Test.Outputs = zeros(numel(find(struct.TestSet)),opts.SampleCycles+opts.DelayCycles(2)+opts.CueCycles,opts.TargetListSize);
struct.Test.Names = {};
pos = 0;
for target=1:opts.TargetListSize,
    for delay = 1:diff(opts.DelayCycles)+1,
        if struct.TestSet(target,delay),
            pos = pos+1;
            
            struct.Test.Names{pos} = sprintf('%d-%d',target,opts.DelayCycles(1)+delay-1);
            
            struct.Test.Inputs(pos,1:opts.SampleCycles,:) = repmat([struct.InputDisplay1D == target 1 0],opts.SampleCycles,1);
            struct.Test.Inputs(pos,opts.SampleCycles+1:opts.SampleCycles+opts.DelayCycles(1)+delay-1,:) = repmat([zeros(1,length(struct.InputDisplay1D)) 1 0],opts.DelayCycles(1)+delay-1,1);
            struct.Test.Inputs(pos,opts.SampleCycles+opts.DelayCycles(1)+delay:end,:) = repmat([zeros(1,length(struct.InputDisplay1D)) 0 1],opts.CueCycles+diff(opts.DelayCycles)+1-delay,1);
            
            struct.Test.Outputs(pos,1:opts.SampleCycles+opts.DelayCycles(1)+delay-1,:) = repmat(zeros(1,opts.TargetListSize),opts.SampleCycles+opts.DelayCycles(1)+delay-1,1);
            struct.Test.Outputs(pos,opts.SampleCycles+opts.DelayCycles(1)+delay:end,:) = repmat(circshift(opts.TargetTemplate',target-1)',opts.CueCycles+diff(opts.DelayCycles)+1-delay,1);
        end
    end
end
%Write to file
f = fopen(sprintf('%sTest.txt',opts.InputFileName),'w');

fprintf(f, sprintf('%d\n',total_inputs));
fprintf(f, sprintf('%d\n',opts.SampleCycles));
fprintf(f, sprintf('%d\n',len_input));
% fprintf(f, sprintf('%d\n',min(opts.DelayCycles)));
fprintf(f, sprintf('%d\n',max(opts.DelayCycles)));
fprintf(f, sprintf('%d\n',opts.CueCycles));
fprintf(f, sprintf('%d\n',opts.TargetListSize));

for comb=1:numel(find(struct.TestSet)),
    fprintf(f,sprintf('input-%s\n',struct.Test.Names{comb}));
    for cycle=1:opts.SampleCycles+opts.DelayCycles(2)+opts.CueCycles,
        for unit=1:length(struct.InputDisplay1D)+2,
            fprintf(f,'%.2f',struct.Test.Inputs(comb,cycle,unit));
            if unit ~= length(struct.InputDisplay1D)+2, fprintf(f,' '); end
        end
        fprintf(f,'\n');
    end
    fprintf(f, 'end\n');
    fprintf(f,sprintf('output-%s\n',struct.Test.Names{comb}));
    for cycle=1:opts.SampleCycles+opts.DelayCycles(2)+opts.CueCycles,
        for unit=1:opts.TargetListSize,
            fprintf(f,'%.2f',struct.Test.Outputs(comb,cycle,unit));
            if unit ~= length(struct.InputDisplay1D)+2, fprintf(f,' '); end
        end
        fprintf(f,'\n');
    end
    fprintf(f, 'end\n');
end
fclose(f);


end