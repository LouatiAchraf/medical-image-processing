%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%écriture d'une video%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       
 clear; close all;      
  mov(:,:,1)=dicomread('T2_0001.IMA');
  mov(:,:,2)=dicomread('T2_0002.IMA');
  mov(:,:,3)=dicomread('T2_0003.IMA');
  mov(:,:,4)=dicomread('T2_0004.IMA');
  mov(:,:,5)=dicomread('T2_0005.IMA');
 
  [vidWidth,vidHeight,nFrames]=size(mov);
  
  
  I=mat2gray(mov);
  
  fig=figure,
  aviobj = VideoWriter('examplevi.avi')
  aviobj.FrameRate=1;
  open (aviobj);
     
  for k=1:nFrames
      imshow(I(:,:,k));
      F = getframe(fig);
      writeVideo(aviobj,F);
  end
  %close(fig)
  close(aviobj);
