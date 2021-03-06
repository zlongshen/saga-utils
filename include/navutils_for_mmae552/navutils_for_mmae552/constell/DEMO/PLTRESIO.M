function fig_handle = pltrestp(auto_mode)

% Example function to plot residual troposphere errors.
% The data are loaded from the file demoplt1.mat
% which is generated by the example function demoplt1.m
% Input:
%   auto_mode = optional flag (only include when in auto mode)

% Written by: Jimmy LaMance 9/5/97
% Copyright (c) 1998 by Constell, Inc.

% load in the data
load demoplt1

if nargin < 1,
  % Get the screen size in pixels to use for location of plots
  set(0,'units','pixels');
  screen_size = get(0,'screensize');
  y_max = screen_size(2) + screen_size(4) - 60;
  x_max = screen_size(1) + screen_size(3) - 50;
  x_step = 110;
  y_step = 60 + y_max;
  
  % set the figure colors to be black background like Matlab 4
  colordef none                                

  % generate the position error figure
  fig_handle = figure('color','black', ...
   'position',[30 50 x_max-30 y_max-50],  ...
   'NumberTitle','off', ...
   'Name','DGPS Residual Ionosphere', ...
   'Tag','fign');
end;

% create a string for the plot title (to be put in the cell array)
title_string = sprintf('DGPS Residual Ionosphere Errors for %d km Baseline',...
                        round(base_line_km)); 

fig_title_cell={'DGPS Residual Ionosphere Errors';};
x = t_diono;
y = diono;
prn = prn_diono;
axis_label_cell = {''; 'Ionosphere Diff. (m)';title_string;};

legend_cell = {''};

descriptive_text_cell = ...
 {'Residual atmospheric path delays are a major concern using differential GPS'; ...
  'over longer baselines.  The residual path delays are caused by different';
  'viewing angles of the base and remote sites, as well as changes in the atmosphere';
  'over wide geographic areas.  The example case shown here has a base station ';
  'mask of 10 degrees.  For lower elevation satellites, the residual ionosphere';
  'errors would become even larger.'};

if nargin < 1,
  textwin2(fig_title_cell,x,y,prn,axis_label_cell,legend_cell, ...
      descriptive_text_cell,1);

  % Determine the location for the plot in upper right corner
  x_min = x_max / 10;
  y_min = y_max / 10;

  % set the figure position
  set(fig_handle,'position',[x_min y_min x_max/1.25 y_max/1.25]);
else,
  fig_handle = gcf;
  textwin2(fig_title_cell,x,y,prn,axis_label_cell,legend_cell, ...
      descriptive_text_cell);
end;

% end of PLTNAV
