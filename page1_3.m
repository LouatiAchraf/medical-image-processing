
function varargout = page1_3(varargin)
% PAGE1_3 M-file for page1_3.fig
%      PAGE1_3, by itself, creates a new PAGE1_3 or raises the existing
%      singleton*.
%
%      H = PAGE1_3 returns the handle to a new PAGE1_3 or the handle to
%      the existing singleton*.
%
%      PAGE1_3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAGE1_3.M with the given input arguments.
%
%      PAGE1_3('Property','Value',...) creates a new PAGE1_3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before page1_3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to page1_3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help page1_3

% Last Modified by GUIDE v2.5 17-Nov-2021 20:12:27
global I
I = im2bw(imread('cameraman.tif')); 
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @page1_3_OpeningFcn, ...
                   'gui_OutputFcn',  @page1_3_OutputFcn, ...
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


% --- Executes just before page1_3 is made visible.
function page1_3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to page1_3 (see VARARGIN)

% Choose default command line output for page1_3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global I
x1 = 3.5*ecg(2700);%la durée du signal est 675ms
y=[];
n=4;
for i=1:n
 y=[y x1];
end
size(y)
t =0.00025:0.00025:2.7;
w=0.00025:0.00025:0.675;
axes(handles.axes1), plot(t,y),title('signal 1D original');


R=I(:,:,1);
axes(handles.axes2),imshow (R,'DisplayRange',[]) ,title 'signal 2D original'  ; 



% UIWAIT makes page1_3 wait for user response (see UIRESUME)

% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = page1_3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global I
x1 = 3.5*ecg(2700);%la durée du signal est 675ms
y=[];
n=4;
for i=1:n
 y=[y x1];
end
size(y)
t =0.00025:0.00025:2.7;
w=0.00025:0.00025:0.675;
YA= wiener2(y, [ 6 6]);
axes(handles.axes1), plot(t,YA),title 'filtre adaptatif';


R=I(:,:,1);
RA= wiener2(R, [ 6 6]);
axes(handles.axes2),imshow (RA) ,title 'filtre adaptatif'  ; 


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x1 = 3.5*ecg(2700);%la durée du signal est 675ms
global I
y=[];
n=4;
for i=1:n
 y=[y x1];
end
size(y)
t =0.00025:0.00025:2.7;
w=0.00025:0.00025:0.675;
Smed=medfilt2(y);
axes(handles.axes1), plot(t,Smed),title 'filtre median';


R=I(:,:,1);
Jmed=medfilt2(R);
axes(handles.axes2),imshow (Jmed) ,title 'filtre median '  ; 


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
t=3;
h1 = fspecial('average',t);

x1 = 3.5*ecg(2700);%la durée du signal est 675ms
y=[];
n=4;
for i=1:n
 y=[y x1];
end
size(y)
t =0.00025:0.00025:2.7;
w=0.00025:0.00025:0.675;
Smean =imfilter(y,h1);
axes(handles.axes1), plot(t,Smean),title 'filtre moyenneur';
R=I(:,:,1);
Jmean=imfilter(R,h1);
axes(handles.axes2),imshow (Jmean) ,title 'filtre moyenneur '  ; 



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x1 = 3.5*ecg(2700);%la durée du signal est 675ms
global I
y=[];
n=4;
for i=1:n
 y=[y x1];
end
size(y)
t =0.00025:0.00025:2.7;
w=0.00025:0.00025:0.675;
H= [-1 1 1; 0 0 0 ; 1 1 1 ] ;
V=-H';
Gh1=filter2(H,y);
Gv1=filter2(V,y);
G1=(Gh1.*Gh1 + Gv1.*Gv1);
Gf1=sqrt(Gh1.*Gh1 + Gv1.*Gv1);
axes(handles.axes1), plot(t,Gf1),title 'filtre robert';
R=I(:,:,1);
H= [-1 1 1; 0 0 0 ; 1 1 1 ] ;
V=-H';
Gh=filter2(H,R);
Gv=filter2(V,R);
G=(Gh.*Gh + Gv.*Gv);
Gf=sqrt(Gh.*Gh + Gv.*Gv);
axes(handles.axes2), imshow (Gf),title 'filtre robert';


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
x1 = 3.5*ecg(2700);%la durée du signal est 675ms
y=[];
n=4;
for i=1:n
 y=[y x1];
end
size(y)
t =0.00025:0.00025:2.7;
w=0.00025:0.00025:0.675;
H= [-1 0; 0 1 ] ;
V=- [0 -1; 1 0 ] ;
Gh1=filter2(H,y);
Gv1=filter2(V,y);
G1=(Gh1.*Gh1 + Gv1.*Gv1);
Gf1=sqrt(Gh1.*Gh1 + Gv1.*Gv1);
axes(handles.axes1), plot(t,Gf1),title 'filtre prewith';
R=I(:,:,1);
H= [-1 0; 0 1 ] ;
V=- [0 -1; 1 0 ] ;
Gh=filter2(H,R);
Gv=filter2(V,R);
G=(Gh.*Gh + Gv.*Gv);
Gf=sqrt(Gh.*Gh + Gv.*Gv);
axes(handles.axes2), imshow (Gf),title 'filtre prewith';



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
x1 = 3.5*ecg(2700);%la durée du signal est 675ms
y=[];
n=4;
for i=1:n
 y=[y x1];
end
size(y)
t =0.00025:0.00025:2.7;
w=0.00025:0.00025:0.675;
seuil=0.8;
H=fspecial('sobel');
V=-H';
Gh1=filter2(H,y);
Gv1=filter2(V,y);
G1=(Gh1.*Gh1 + Gv1.*Gv1);
Gf1=sqrt(Gh1.*Gh1 + Gv1.*Gv1);
axes(handles.axes1), plot(t,Gf1),title 'filtre sobel';
R=I(:,:,1);
seuil=0.8;
H=fspecial('sobel');
V=-H';
Gh=filter2(H,R);
Gv=filter2(V,R);
G=(Gh.*Gh + Gv.*Gv);
Gf=sqrt(Gh.*Gh + Gv.*Gv);
axes(handles.axes2), imshow (Gf),title 'filtre sobel';



% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
x1 = 3.5*ecg(2700);%la durée du signal est 675ms
y=[];
n=4;
for i=1:n
 y=[y x1];
end
size(y)
t =0.00025:0.00025:2.7;
w=0.00025:0.00025:0.675;
H= [1 -2 1; -2 4 -2; 1 -2 1 ] ;
V=-H';
Gh1=filter2(H,y);
Gv1=filter2(V,y);
G1=(Gh1.*Gh1 + Gv1.*Gv1);
Gf1=sqrt(Gh1.*Gh1 + Gv1.*Gv1);
axes(handles.axes1), plot(t,Gf1),title 'filtre laplacien';; 
R=I(:,:,1);
H= [1 -2 1; -2 4 -2; 1 -2 1 ] ;
V=-H';
Gh=filter2(H,R);
Gv=filter2(V,R);
G=(Gh.*Gh + Gv.*Gv);
Gf=sqrt(Gh.*Gh + Gv.*Gv);
axes(handles.axes2), imshow (Gf),title 'filtre laplacien';




% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close 'Filtrage des signaux 1D et 2D';
run page1 ; 
