function cleanFilesFastFVA(userInteraction)
% Clean log and result files generated by fastFVA
%
% USAGE:
%    cleanFiles(userInteraction)
%
% INPUT:
%    userInteraction:   Boolean variable for requesting explicitly if the files should be removed
%
% .. Author: Laurent Heirendt, LCSB
%

global CBTDIR

if nargin < 1
    userInteraction = true;
end

% define the root directory of fastFVA
rootDirFastFVA = [CBTDIR filesep 'src' filesep 'modelAnalysis' filesep 'FVA' filesep 'fastFVA'];

% define the directory to the logFiles and results directories
dirLogFiles = [rootDirFastFVA filesep 'logFiles'];

% save the current directory
currentDir = pwd;

% clear previous log files in logFiles/
D = dir([dirLogFiles filesep '*.log']);
nbFiles = numel(D);
if nbFiles > 0
    fprintf('\n Number of files in logFiles/: %d\n', nbFiles);

    if userInteraction
        m = input('\n Do you want to clean all log files in logFiles/ ? - Y/N [Y]: ','s');
    end

    if strcmpi(m, 'y') || ~userInteraction
        cd(dirLogFiles);
        delete *.log
        fprintf(' >> All log files in logFiles/ removed.\n');
    end
else
    fprintf('\n The directory logFiles/ is empty.\n');
end

% change back to the current directory
cd(currentDir);

fprintf('\n');
