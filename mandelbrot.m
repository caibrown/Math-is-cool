% 

c = [0.36 + 0.1i, -.123 - .745i,-.749, -1.25];
pts = 10000; % Number of points in x and y directions of plot

phi = @(z,c) z^2 + c; % function to plot
a = linspace(-0.25,0.25,pts); % Plotting Window
b = linspace(0.5,1,pts);
M = ones(length(a),length(b));

for r = 1:length(a)
    for i = 1:length(b)
        z = 0; % start with z = 0
        cm = a(r) + b(i)*1i;
        for j = 1:100
            z = phi(z,cm);
            if abs(z) > 100
                M(r,i) = j;
                break;
            end
        end
    end
end

% Plot Mandelbrot set
figure(); hold on
xlabel('Real'); ylabel('Imaginary')
colormap(jet(100)); colorbar
image( [-1 1], [-1 1], M')
axis xy; axis equal; axis([ -1 1 -1 1])
