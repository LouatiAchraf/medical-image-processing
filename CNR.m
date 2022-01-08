function varargout = CNR(varargin)
% CNR MATLAB code for CNR.fig
%      CNR, by itself, creates a new CNR or raises the existing
%      singleton*.
%
%      H = CNR returns the handle to a new CNR or the handle to
%      the existing singleton*.
%
%      CNR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CNR.M with the given input arguments.
%
%      CNR('Property','Value',...) creates a new CNR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CNR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CNR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES


% Edit the above text to modify the response to help CNR

% Last Modified by GUIDE v2.5 11-Dec-2020 19:47:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CNR_OpeningFcn, ...
                   'gui_OutputFcn',  @CNR_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SNR is made visible.
function CNR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SNR (see VARARGIN)

% Choose default command line output for SNR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SNR wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CNR_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1;% declaration d’une variable 
global I2;
global I3; 
info = dicominfo ('C:\Users\SBS\Desktop\IB;\Project\TE\TR4000_TE22_20.IMA');
% chargement image 1
I1=dicomread(info); 
axes(handles.axes1)
%affichage de l’image I1 dans l’axes1 
imshow(I1,'DisplayRange',[])
title('TR=4000 , TE=22ms');
info = dicominfo ('C:\Users\SBS\Desktop\IB;\Project\TE\TR4000_TE87_20.IMA');
I2=dicomread (info); 
axes(handles.axes2)
imshow(I2,'DisplayRange',[])
title('TR=4000 , TE=87ms'); 
info = dicominfo ('C:\Users\SBS\Desktop\IB;\Project\TE\TR4000_TE164_20.IMA');
I3=dicomread(info); 
axes(handles.axes3) 
imshow(I3,'DisplayRange',[])
title('TR=4000 , TE=164ms');
%traitement SNR
global I1;
global I2; 
global I3; 
uiwait(msgbox('Veuillez Sélectionner les zones d intéret pour les trois images'));
[handles.currentimage handles.cropRect] = imcrop(handles.axes1); 
axes(handles.axes5);% pour l’affichage de la première sous image en dessous de l’image originale 
imshow(handles.currentimage,'DisplayRange',[]);
title('zone1');
guidata(hObject, handles);%appel la zone de « edit text »
A=double(handles.currentimage); 
[r,c]=size(A);
totmean=sum(A(:))/(r*c);
string1 = sprintf('Moyenne1 = %.3f', totmean);
set(handles.edit1, 'String', string1);
[handles.currentimage handles.cropRect1] = imcrop(handles.axes1);
axes(handles.axes6); 
imshow(handles.currentimage,'DisplayRange',[]);
title('zone2');
guidata(hObject, handles);
B=double(handles.currentimage); 
[r,c]=size(B); 
totmean2=sum(B(:))/(r*c);
string2 = sprintf('Moyenne2 = %.3f', totmean2);
set(handles.edit2, 'String', string2);
Resultat1 = abs((totmean-totmean2)/(totmean+totmean2));
string3 = sprintf('contrast = %.3f',Resultat1);
set(handles.edit7, 'String', string3);
%save Resultat1;
global I2;
[handles.currentimage] = imcrop(I2,handles.cropRect); 
axes(handles.axes7);% pour l’affichage de la première sous image en dessous de l’image originale 
imshow(handles.currentimage,'DisplayRange',[]);
title('zone1');
guidata(hObject, handles);%appel la zone de « edit text »
A=double(handles.currentimage); 
[r,c]=size(A);
totmean3=sum(A(:))/(r*c);
string1 = sprintf('Moyenne1 = %.3f', totmean3);
set(handles.edit3, 'String', string1);
[handles.currentimage ] = imcrop(I2,handles.cropRect1);
axes(handles.axes8); 
imshow(handles.currentimage,'DisplayRange',[]);
title('zone2');
guidata(hObject, handles);
B=double(handles.currentimage); 
[r,c]=size(B); 
totmean4=sum(B(:))/(r*c);
string2 = sprintf('Moyenne2= %.3f', totmean4);
set(handles.edit4, 'String', string2);
Resultat2 =abs((totmean3-totmean4)/(totmean3+totmean4));
string3 = sprintf('contrast= %.3f',Resultat2);
set(handles.edit8, 'String', string3);
%save Resultat2;
global I3;
[handles.currentimage] = imcrop(I3,handles.cropRect); 
axes(handles.axes9);% pour l’affichage de la première sous image en dessous de l’image originale 
imshow(handles.currentimage,'DisplayRange',[]);
title('zone1');
guidata(hObject, handles);%appel la zone de « edit text »
A=double(handles.currentimage); 
[r,c]=size(A);
totmean5=sum(A(:))/(r*c);
string1 = sprintf('moyenne1 = %.3f', totmean5);
set(handles.edit5, 'String', string1);
[handles.currentimage] = imcrop(I3,handles.cropRect1);
axes(handles.axes10); 
imshow(handles.currentimage,'DisplayRange',[]);
title('zone2');
guidata(hObject, handles);
B=double(handles.currentimage); 
[r,c]=size(B); 
totmean6=sum(B(:))/(r*c);
string2 = sprintf('Moyenne2 = %.3f', totmean6);
set(handles.edit6, 'String', string2);
Resultat3 =abs((totmean5-totmean6)/(totmean5+totmean6));
string3 = sprintf('contrast = %.3f',Resultat3);
set(handles.edit9, 'String', string3);
%save Resultat3;

contrast=[Resultat1,Resultat2,Resultat3];
TE=[22,87,164];
axes(handles.axes11);
plot(TE,contrast);
title('CNR=f(TE) pour TR=4000ms');
xlabel('TE(ms)');
ylabel('contrast');




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1;% declaration d’une variable 
global I2;
global I3; 
info = dicominfo ('C:\Users\SBS\Desktop\IB;\Project\TR\TR300TE10_1.IMA');
% chargement image 1
I1=dicomread(info); 
axes(handles.axes1)
%affichage de l’image I1 dans l’axes1 
imshow(I1,'DisplayRange',[])
title('TE=10ms , TR=300ms');
info = dicominfo ('C:\Users\SBS\Desktop\IB;\Project\TR\TR1000TE10_1.IMA');
I2=dicomread (info); 
axes(handles.axes2)
imshow(I2,'DisplayRange',[])
title('TE=10ms , TR=1000ms'); 
info = dicominfo ('C:\Users\SBS\Desktop\IB;\Project\TR\TR2000TE10_1.IMA');
I3=dicomread(info); 
axes(handles.axes3) 
imshow(I3,'DisplayRange',[])
title('TE=10ms , TR=2000ms');

%traitement contrast
global I1;
global I2; 
global I3; 
uiwait(msgbox('Veuillez Sélectionner les zones d intéret pour les trois images'));
[handles.currentimage handles.cropRect] = imcrop(handles.axes1); 
axes(handles.axes5);% pour l’affichage de la première sous image en dessous de l’image originale 
imshow(handles.currentimage,'DisplayRange',[]);
title('zone1');
guidata(hObject, handles);%appel la zone de « edit text »
A=double(handles.currentimage); 
[r,c]=size(A);
totmean=sum(A(:))/(r*c);
string1 = sprintf('Moyenne1 = %.3f', totmean);
set(handles.edit1, 'String', string1);
[handles.currentimage handles.cropRect1] = imcrop(handles.axes1);
axes(handles.axes6); 
imshow(handles.currentimage,'DisplayRange',[]);
title('zone2');
guidata(hObject, handles);
B=double(handles.currentimage); 
[r,c]=size(B); 
totmean2=sum(B(:))/(r*c);
string2 = sprintf('Moyenne2 = %.3f', totmean2);
set(handles.edit2, 'String', string2);
Resultat1 = abs((totmean-totmean2)/(totmean+totmean2));
string3 = sprintf('contrast = %.3f',Resultat1);
set(handles.edit7, 'String', string3);
%save Resultat1;
global I2;
[handles.currentimage] = imcrop(I2,handles.cropRect); 
axes(handles.axes7);% pour l’affichage de la première sous image en dessous de l’image originale 
imshow(handles.currentimage,'DisplayRange',[]);
title('zone1');
guidata(hObject, handles);%appel la zone de « edit text »
A=double(handles.currentimage); 
[r,c]=size(A);
totmean3=sum(A(:))/(r*c);
string1 = sprintf('Moyenne1 = %.3f', totmean3);
set(handles.edit3, 'String', string1);
[handles.currentimage ] = imcrop(I2,handles.cropRect1);
axes(handles.axes8); 
imshow(handles.currentimage,'DisplayRange',[]);
title('zone2');
guidata(hObject, handles);
B=double(handles.currentimage); 
[r,c]=size(B); 
totmean4=sum(B(:))/(r*c);
string2 = sprintf('Moyenne2 = %.3f', totmean4);
set(handles.edit4, 'String', string2);
Resultat2 = abs((totmean3-totmean4)/(totmean3+totmean4));
string3 = sprintf('contrast = %.3f',Resultat2);
set(handles.edit8, 'String', string3);
%save Resultat2;
global I3;
[handles.currentimage] = imcrop(I3,handles.cropRect); 
axes(handles.axes9);% pour l’affichage de la première sous image en dessous de l’image originale 
imshow(handles.currentimage,'DisplayRange',[]);
title('zone1');
guidata(hObject, handles);%appel la zone de « edit text »
A=double(handles.currentimage); 
[r,c]=size(A);
totmean5=sum(A(:))/(r*c);
string1 = sprintf('Moyenne1 = %.3f', totmean5);
set(handles.edit5, 'String', string1);
[handles.currentimage] = imcrop(I3,handles.cropRect1);
axes(handles.axes10); 
imshow(handles.currentimage,'DisplayRange',[]);
title('zone2');
guidata(hObject, handles);
B=double(handles.currentimage); 
[r,c]=size(B); 
totmean6=sum(B(:))/(r*c);
string2 = sprintf('Moyenne2 = %.3f', totmean6);
set(handles.edit6, 'String', string2);
Resultat3 = abs((totmean5-totmean6)/(totmean5+totmean6));
string3 = sprintf('contrast = %.3f',Resultat3);
set(handles.edit9, 'String', string3);
%save Resultat3;

contrast=[Resultat1,Resultat2,Resultat3];
TR=[300,700,2000];
axes(handles.axes11);
plot(TR,contrast);
title('CNR=f(TR) pour TE=10ms');
xlabel('TR(ms)');
ylabel('contrast');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close CNR



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close CNR
run Dashboard


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function pushbutton4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
