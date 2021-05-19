close all; 
global pets

pets = {'Nyctiphanes_australis'};
check_my_pet(pets); 

estim_options('default'); 
estim_options('max_step_number',2e3); 
estim_options('max_fun_evals',2e3); 

%sb - symmetric bounded (default)
%su - symmetric unbounded
estim_options('loss_function', 'sb')

% pars_init_method':
%   0 - get initial estimates from automatized computation (default)
%   1 - read initial estimates from .mat file (for continuation)
%   2 - read initial estimates from pars_init file
estim_options('pars_init_method' , 1);

% 'results_output':
%   0 - prints results to screen (default)
%   1 - prints results to screen, saves to .mat file
%   2 - saves data to .mat file and graphs to .png files
%   3 ? like 2, but also prints graphs to .png files (default is 3)
%   4 ? like 3, but also prints html with implied traits
%   5 ? like 3, but also prints html with implied traits including related species
%   6 - like 5, but also prints html with population traits
estim_options('results_output', 1);

% 'method':
%   'nm' - use Nelder-Mead method;
%   'no' - do not estimate;
estim_options('method', 'nm');

% for implied properties of the model
% load('results_Nyctiphanes_australis.mat');
% prt_report_my_pet({par, metaPar, txtPar, metaData}),

tic;
estim_pars; 
toc;