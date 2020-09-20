function drawPls(app)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    n=512;
    nhop=n/4;
    Y=stft(app.y,n,n,nhop);
    imshow(flipud(Y));
    colormap(jet);
    h=imfreehand;
    mask=h.createMask();
    
    close();
    
    Ymod=flipud(1-mask).*Y;
    ymod=istft(Ymod,n,n,nhop);
    app.y=ymod;
    %app.Y=app.y;
end

