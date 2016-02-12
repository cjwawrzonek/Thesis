function weights(N,a,r,mode)

layer2d = zeros(N,N,N,N);

if mode, figure; end
for ci=1:N, for cj=1:N,
        
    density = zeros(N,N);
    for i=1:N, for j=1:N,
        density(i,j) = exp(-(a*((i-ci)^2)+a*((j-cj)^2)));
    end; end

    conns = (rand(N) <= density);
    layer2d(ci,cj,:,:) = conns;
    
    switch mode,
        case 1, vis = double(conns); vis(ci,cj) = 2;
        case 2, vis = density;
    end
    if mode, subplot(N,N,(ci-1)*N+cj); imagesc(vis); end
    
end; end

layer = zeros(N^2,N^2);
for ci=1:N, for cj=1:N,
    p1 = sub2ind([N N],cj,ci);
    for i=1:N, for j=1:N,
            p2 = sub2ind([N N],j,i);
            layer(p1,p2) = layer2d(ci,cj,i,j);
    end; end
end; end

mask = [ones(1,N^2); layer];
w = [zeros(1,N^2); ((r(2)-r(1)).*rand(N^2)+r(1)).*layer];

figure; imagesc(mask);
figure; imagesc(w);

f = fopen('hidden_mask.txt','w');
for i=1:size(mask,1),
    s = mat2str(mask(i,:));
    fprintf(f,sprintf('%s\n',s(2:end-1)));
end;
fclose(f);

f = fopen('hidden_weights.txt','w');
for i=1:size(w,1),
    s = mat2str(w(i,:),3);
    fprintf(f,sprintf('%s\n',s(2:end-1)));
end;
fclose(f);