% Code to create high resolution parcellation with regions of aproximatly
% the same area
% Please cite: "Effects of network resolution on topological properties of
% human neocortex."

% Rafael Romero Garcia 
% 09 May 2018
% rr480@cam.ac.uk
% University of Cambridge 

%Requirements
%IMPORTANT: For an accurate symetric parcellation, it is recommended to use fsaverage_sym 
%Freesurfer needs to be installed
%Freesurfer libraries (freesurfer/matlab) need to be added to matlab path
%Add the folder SubParcellation_MFiles to Matlab path
%Parcellation is based on random seeds so each execution will return a different parcel distribution 

%Usage
%
% Subject to parcellate, has to be located at $SUBJECTS_DIR
% subject_name='fsaverage_sym'       
% Area in mm2 of each parcel
% surface=300;                                     
% subParcellation(subject_name,surface);

function subParcellation(subject_name,surface,outName)
    subject_path= [getenv('SUBJECTS_DIR') subject_name '/']; 
    subParcellationHemi(subject_path,surface,'lh');
    subParcellationHemi(subject_path,surface,'rh');
    subParcellation_symetric(surface,subject_path,outName)   
    display('Subparcellation finished! Visualise using:');   
    display(['tksurfer '  subject_name ' lh pial -annotation ' num2str(surface)  '.aparc']);
    display(['tksurfer '  subject_name ' rh pial -annotation ' num2str(surface)  '.aparc']);
end
