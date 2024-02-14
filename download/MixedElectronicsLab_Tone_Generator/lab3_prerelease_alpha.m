close all; clear variables; clc;

Fs = 48000;

time = 1;

freq_d = (1000:2000:16000) / Fs;

n = 0:1:time*Fs-1;

sin = 1 .* sin(2 .* pi .* freq_d' .* n);

canvas = figure();
plot([1 1 2 2 3 3], [-1 5 5 -1 -1 5], '-k', [-1 5 5 -1 -1 5], [1 1 2 2 3 3], '-k', 'LineWidth', 3);
xlim([0 4]);
ylim([0 4]);
axis square;
set(gca,'xtick',[], 'xticklabel', [],'ytick',[], 'yticklabel', [], 'LineWidth', 3);
set(canvas, 'ToolBar', 'none', 'resize', 'off');
text(0.2, 3.55, '1', "FontSize", 69);
text(1.2, 3.55, '2', "FontSize", 69);
text(2.2, 3.55, '3', "FontSize", 69);
text(0.2, 2.55, '4', "FontSize", 69);
text(1.2, 2.55, '5', "FontSize", 69);
text(2.2, 2.55, '6', "FontSize", 69);
text(0.2, 1.55, '7', "FontSize", 69);
text(1.2, 1.55, '8', "FontSize", 69);
text(2.2, 1.55, '9', "FontSize", 69);
text(0.2, 0.35, '*', "FontSize", 69);
text(1.2, 0.55, '0', "FontSize", 69);
text(2.2, 0.55, '#', "FontSize", 69);
text(3.15, 3.55, 'A', "FontSize", 69);
text(3.15, 2.55, 'B', "FontSize", 69);
text(3.15, 1.55, 'C', "FontSize", 69);
text(3.15, 0.55, 'D', "FontSize", 69);

for i = 1:1e9

  clc;

  try
    [x,y] = ginput(1);
  catch ERROR
     return
  end
  col = floor(x) + 1;
  row = floor(y) + 5;
  try
    sound(sin(col,:) + sin(row,:), Fs);
  catch ERROR
  end

end