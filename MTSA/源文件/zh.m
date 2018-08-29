function varargout = zh(varargin)
% ZH MATLAB code for zh.fig
%      ZH, by itself, creates a new ZH or raises the existing
%      singleton*.
%
%      H = ZH returns the handle to a new ZH or the handle to
%      the existing singleton*.
%
%      ZH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZH.M with the given input arguments.
%
%      ZH('Property','Value',...) creates a new ZH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zh_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zh_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zh

% Last Modified by GUIDE v2.5 12-Feb-2018 20:12:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zh_OpeningFcn, ...
                   'gui_OutputFcn',  @zh_OutputFcn, ...
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


% --- Executes just before zh is made visible.
function zh_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zh (see VARARGIN)

% Choose default command line output for zh
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zh wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.text7, 'foregroundColor', [0.41176 0.41176 0.41176]);
set(handles.text7,'background',[0.8 0.8 0.8]);
set(handles.edit4,'string',356);
set(handles.text11,'background',[0.8 0.8 0.8]);
set(handles.text12,'background',[0.8 0.8 0.8]);
set(handles.text15,'background',[0.8 0.8 0.8]);
set(handles.text16,'background',[0.8 0.8 0.8]);
set(handles.text24,'background',[0.8 0.8 0.8]);
set(handles.text28,'background',[0.8 0.8 0.8]);
set(handles.radiobutton1,'value',1);
set(handles.popupmenu5,'string',{'haar','db','sym','coif','bior','rbio','dmey'...
    'fk'});
set(handles.popupmenu6,'string',{'1','2','3','4','5','6','7','8','9','10'});
set(handles.popupmenu7,'Visible','off');
set(handles.axes15,'visible','off');
h=handles.figure1;
newIcon=javax.swing.ImageIcon('图片6.png');
figFrame=get(h,'JavaFrame');
figFrame.setFigureIcon(newIcon);
% --- Outputs from this function are returned to the command line.
function varargout = zh_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
currentnumber=get(handles.listbox1,'value');
global A;
global filename;
global dataN;
global dataE;
global dataU;
global data;
global fx;
global name;%台站名字
axes(handles.axes6);
global data_now;
global data_g;
data_now=A{currentnumber};
plot(data_now(:,1),data_now(:,4));
ylabel('N');
title(name{currentnumber});
set(gca,'xtick',[]);
axes(handles.axes7);
plot(data_now(:,1),data_now(:,5));
ylabel('E');
set(gca,'xtick',[]);
axes(handles.axes8);
plot(data_now(:,1),data_now(:,6));
ylabel('U');
switch fx
    case 1
        data=dataN{currentnumber};
        data_g=dataN;%data_g为所有测站残差的集合
        fx_kzt='N';
    case 2
        data=dataE{currentnumber};
        data_g=dataE;
        fx_kzt='E';
    case 3
        data=dataU{currentnumber};
        data_g=dataU;
        fx_kzt='U';
end
axes(handles.axes9);
plot(data(:,1),data(:,2));
global kzt;%控制台信息
list_kzt=['>>当前台站:',name{currentnumber},' ','方向:',fx_kzt,'(',datestr(now),')',10];
%list_kzt=sprintf('\n%s',list_kzt);
%kzt=[kzt,'>>当前台站:',name{currentnumber},' ','方向:',fx_kzt,' '];
kzt=[kzt,list_kzt];
%kzt=sprintf('%s\n',kzt);
set(handles.edit2,'string',kzt);
% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global folder_name;
global n_s;
global A;
global dataN;
global dataE;
global dataU;
folder_name=uigetdir;
wjdz=fullfile(folder_name,'*.neu');
file=dir(wjdz);
n_s=length(file);
global filename;
global name;
filename=[];
for k=1:n_s
    A{k}=load(fullfile(folder_name,file(k).name));
    filename=[filename;file(k).name(1:end-4)];
    name{k}=file(k).name(1:end-4);  
end
set(handles.listbox1,'string',filename);
for i=1:n_s
    x=A{i}(:,1);
    xx{i}=x;%%%%%%%元胞数组来动态储存
    y1=A{i}(:,4);
    y2=A{i}(:,5);
    y3=A{i}(:,6);
    yy1{i}=y1;
    yy2{i}=y2;
    yy3{i}=y3;
    z1=A{i}(:,7);
    z2=A{i}(:,8);
    z3=A{i}(:,9);
    p=length(x);
    q=length(z1);
    for j=1:length(x)
         B(j,1)=1;
         B(j,2)=x(j);
         B(j,3)=sin(2*pi*x(j));
         B(j,4)=cos(2*pi*x(j));
         B(j,5)=sin(4*pi*x(j));
         B(j,6)=cos(4*pi*x(j));
         L1(j)=y1(j);
         L2(j)=y2(j);
         L3(j)=y3(j);
    end
    X1=inv(B'*B)*(B'*L1');
    X2=inv(B'*B)*(B'*L2');
    X3=inv(B'*B)*(B'*L3');
    v1=B*X1-L1';
    v2=B*X2-L2';
    v3=B*X3-L3';
    clear B;
    clear L1;
    clear L2;
    clear L3;
    r=length(v1);
    v1=v1*1000;
    v2=v2*1000;
    v3=v3*1000;%以mm为单位
    vv1{i}=v1;%%元胞数组来动态储存
    vv2{i}=v2;%%元胞数组来动态储存
    vv3{i}=v3;%%元胞数组来动态储存
    z1=z1*1000;
    z2=z2*1000;
    z3=z3*1000;
    zz1{i}=z1;
    zz2{i}=z2;
    zz3{i}=z3;
    dataN{i}=[x v1 z1];
    dataE{i}=[x v2 z2];
    dataU{i}=[x v3 z3];
end
global kzt;
kzt=['>>载入文件成功','(',datestr(now),')',10];
%kzt=sprintf('%s\n',kzt);
set(handles.edit2,'string',kzt);

% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton4,'background','white');
set(handles.pushbutton5,'background',[0.94 0.94 0.94]);
set(handles.pushbutton6,'background',[0.94 0.94 0.94]);
set(handles.pushbutton20,'background',[0.94 0.94 0.94]);
set(handles.uipanel1,'visible','on');
set(handles.uipanel2,'visible','off');

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%set(handles.uipanel1,'visible','off');
set(handles.pushbutton4,'background',[0.94 0.94 0.94]);
set(handles.pushbutton5,'background','white');
set(handles.pushbutton6,'background',[0.94 0.94 0.94]);
set(handles.pushbutton20,'background',[0.94 0.94 0.94]);
set(handles.uipanel2,'visible','on');
set(handles.uipanel8,'visible','off');
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton4,'background',[0.94 0.94 0.94]);
set(handles.pushbutton5,'background',[0.94 0.94 0.94]);
set(handles.pushbutton6,'background','white');
set(handles.pushbutton20,'background',[0.94 0.94 0.94]);
set(handles.uipanel8,'visible','on');
set(handles.uipanel12,'visible','off');

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --------------------------------------------------------------------


% --------------------------------------------------------------------
function uipushtool9_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%{
global folder_name;
global n_s;%文件数目
global A;%用来存每个站的数据
global ff;
folder_name=uigetdir;
gg='\';
global new_folder_name;
new_folder_name=[folder_name,gg];
ext='.txt';
n_j=dir(folder_name);

n_s=length(n_j)-2; %得到文件夹下所有文件的数目，减2是因为有两个隐藏文件
i_A=0;
for k=1:n_s       %依次获取文件夹下各个站的txt文件存入到A中
    id=num2str(k);
    flies{k}=[folder_name,gg,id,ext];
    %fid=fopen(flies{k});
    A{k}=load(flies{k});
    i_A=i_A+1;
end
wjdz=[folder_name,'\','*.txt'];
ff=dir(wjdz);
global i_b;
if i_A==0 %用以判断文件读取是否成功
    i_b=0;
else
    i_b=1;
end
%}
global folder_name;
global n_s;
global A;
global dataN;
global dataE;
global dataU;
folder_name=uigetdir;
wjdz=fullfile(folder_name,'*.pos');
file=dir(wjdz);
n_s=length(file);
global filename;
global name;
filename=[];
for k=1:n_s
    A{k}=load(fullfile(folder_name,file(k).name));
    filename=[filename;file(k).name(1:end-4)];
    name{k}=file(k).name(1:end-4);  
end
set(handles.listbox1,'string',filename);
for i=1:n_s
    x=A{i}(:,1);
    xx{i}=x;%%%%%%%元胞数组来动态储存
    y1=A{i}(:,4);
    y2=A{i}(:,5);
    y3=A{i}(:,6);
    yy1{i}=y1;
    yy2{i}=y2;
    yy3{i}=y3;
    z1=A{i}(:,7);
    z2=A{i}(:,8);
    z3=A{i}(:,9);
    p=length(x);
    q=length(z1);
    for j=1:length(x)
         B(j,1)=1;
         B(j,2)=x(j);
         B(j,3)=sin(2*pi*x(j));
         B(j,4)=cos(2*pi*x(j));
         B(j,5)=sin(4*pi*x(j));
         B(j,6)=cos(4*pi*x(j));
         L1(j)=y1(j);
         L2(j)=y2(j);
         L3(j)=y3(j);
    end
    X1=inv(B'*B)*(B'*L1');
    X2=inv(B'*B)*(B'*L2');
    X3=inv(B'*B)*(B'*L3');
    v1=B*X1-L1';
    v2=B*X2-L2';
    v3=B*X3-L3';
    clear B;
    clear L1;
    clear L2;
    clear L3;
    r=length(v1);
    v1=v1*1000;
    v2=v2*1000;
    v3=v3*1000;%以mm为单位
    vv1{i}=v1;%%元胞数组来动态储存
    vv2{i}=v2;%%元胞数组来动态储存
    vv3{i}=v3;%%元胞数组来动态储存
    z1=z1*1000;
    z2=z2*1000;
    z3=z3*1000;
    zz1{i}=z1;
    zz2{i}=z2;
    zz3{i}=z3;
    dataN{i}=[x v1 z1];
    dataE{i}=[x v2 z2];
    dataU{i}=[x v3 z3];
end
global kzt;
kzt=['>>载入文件成功','(',datestr(now),')',10];
%kzt=sprintf('%s\n',kzt);
set(handles.edit2,'string',kzt);
% --------------------------------------------------------------------
function uipushtool7_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('sz');


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
value=get(handles.edit4,'value');
set(handles.edit4,'string',get(handles.slider2,'value'));

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



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


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;%剔除异常值过后的数据
[n_data,tt1,xx1,d1,d2]=funycz(data);
axes(handles.axes9);
hold on;
plot(tt1,xx1,'ro');
set(handles.edit3,'string',d1);
set(handles.edit5,'string',d2);
data=n_data;
global n_s;
global data_g;
global data_g_yc;%存有所有测站的去除异常值后的残差
for i=1:n_s
    [n_data,tt1,xx1,d1,d2]=funycz(data_g{i});
    data_g_yc{i}=n_data;
end
global kzt;
length(tt1)
ycz_kzt=['>>异常值剔除成功','(',datestr(now),')',10];
%ycz_kzt=sprintf('\n%s',ycz_kzt);
kzt=[kzt ycz_kzt];
%kzt=sprintf('%s\n',kzt);
set(handles.edit2,'string',kzt);
% --- Executes during object creation, after setting all properties.
function text7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



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


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton1,'value',1);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',1);
set(handles.radiobutton3,'value',0);

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',1);

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;
%data=load('E:\txt.txt');
global cz_data;
[cz_data ,cz,dd_start,dd_end]=funcz(data);
axes(handles.axes9);
hold on;
data_start=data(dd_start,1:3);
data_end=data(dd_end,1:3);
plot(data_start(:,1),data_start(:,2),'r.');
plot(data_end(:,1),data_end(:,2),'y.');
global n_s;
global data_g_yc;
global data_g_cz;
global data_lhcc;
for i=1:n_s
    [B,C,dd_start,dd_end]=funcz(data_g_yc{i});
    data_g_cz{i}=B;
end
data_lhcc=lianhecc(data_g_cz,n_s);%e为联合残差
%plot(cz(:,1),cz(:,2),'r.');
if(get(handles.radiobutton1,'value'))
    czlx=get(handles.radiobutton1,'string');%
elseif(get(handles.radiobutton2,'value'))
    czlx=get(handles.radiobutton2,'string');
elseif(get(handles.radiobutton3,'value'))
    czlx=get(handles.radiobutton3,'string');
end
global kzt;
cz_kzt=['>>插值成功','(',czlx,')','(',datestr(now),')',10];
%cz_kzt=sprintf('\n%s',cz_kzt);
kzt=[kzt,cz_kzt];
%kzt=sprintf('%s\r\n',kzt);
set(handles.edit2,'string',kzt);

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
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


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;%剔除异常值过后的数据，要换，换成剔除共模误差的数据;
[f1,mag,T,Q,t1,t2,xx]=funpfx(data);
axes(handles.axes12);
plot(f1,mag);
xlabel('周期T');
ylabel('功率');
axes(handles.axes13);
plot(T,Q,'k.');
hold on;
plot(t1,t2,'r');
xlabel('Frequency(lnf)');
ylabel('Power(lnP)');
set(handles.edit9,'string',exp(xx(1)));
set(handles.edit10,'string',xx(2));
global kzt;
pfx_kzt=['>>绘制功率谱图成功','(',datestr(now),')',10];
kzt=[kzt,pfx_kzt];
set(handles.edit2,'string',kzt);
%以后会修改
set(handles.edit11,'string',2.31);
set(handles.edit12,'string',3.52);
set(handles.edit13,'string',0.15);
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


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text17.



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



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5
global wn1;
switch get(handles.popupmenu5,'value')
    case 1
        wn1='haar';
        set(handles.popupmenu7,'Visible','off');
    case 2
        wn1='db';
        set(handles.popupmenu7,'visible','on'); 
        set(handles.popupmenu7,'string',{'1','2','3','4','5','6','7','8','9','10'});
    case 6
        wn1='sym';
        set(handles.popupmenu7,'visible','on'); 
        set(handles.popupmenu7,'string',{'2','3','4','5','6','7','8'});
    case 4
        wn1='coif';
        set(handles.popupmenu7,'visible','on'); 
        set(handles.popupmenu7,'string',{'1','2','3','4','5'});
    case 5
        wn1='bior';
        set(handles.popupmenu7,'visible','on'); 
        set(handles.popupmenu7,'string',{'1.1','1.3','1.5','2.2','2.4','2.6','2.8','3.1','3.3','3.5'...
            '3.7','3.9','4.4','5.5','6.8'});
    case 6
        wn1='rbio';
        set(handles.popupmenu7,'visible','on'); 
        set(handles.popupmenu7,'string',{'1.1','1.3','1.5','2.2','2.4','2.6','2.8','3.1','3.3','3.5'...
            '3.7','3.9','4.4','5.5','6.8'});
    case 7
        wn1='dmey';
        set(handles.popupmenu7,'Visible','off');
    case 8
        wn1='fk';
        set(handles.popupmenu7,'visible','on'); 
        set(handles.popupmenu7,'string',{'4','6','8','14','18','22'});
end
% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton16.
global kz;
kz=3;
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global kz;
if kz~=2
    axes(handles.uipanel12);
end
global wn1;
global PB;
global fx;
global h;%小波分析图形句柄
global H;%EMD图形句柄
global cd;%用于控制小波分析和EMD之间图形句柄的消除，默认为0，当启动小波分析时，变为1
global cs;
if get(handles.popupmenu5,'value')==1||get(handles.popupmenu5,'value')==7
    wn2='';
else
    list=get(handles.popupmenu7,'String');
    val1=get(handles.popupmenu7,'Value');
    wn2=list{val1};
end

cd
%{
if cd==2
    for i=1:length(H)
        delete(H(i));
    end
end
%}
wn=[wn1,wn2];
list2=get(handles.popupmenu6,'String');
val2=get(handles.popupmenu6,'Value');
cs=str2num(list2{val2});%cs为分解层数
global cz_data;
s=cz_data(:,2);
%s=PB{fx}(:,2);
set(handles.edit14,'string',length(s));
yll=['a',num2str(cs)];%a9
for i=1:cs
    yxs{i}=['d',num2str(i)];
end
yxs=fliplr(yxs);
[C,L]=wavedec(s,cs,wn);
A=wrcoef('a',C,L,wn,cs);%最高近似、
for i=1:cs
    D{i}=wrcoef('d',C,L,wn,i);
end
D=fliplr(D);
pn=cs+2;%控制subplot个数
str=['s=',yll,'+'];
for i=1:cs-1
    str=[str,yxs{i},'+'];
end
str=[str,yxs{cs}];
%figure(uipanel12);
h(1)=subplot(pn,1,1);
plot(s,'r');
title(str);
ylabel('s','FontSize',16);
set(get(gca, 'YLabel'), 'Rotation', 0);
%ylabel('rotation',270);
pos = get(gca, 'Position');
pos_y=get(get(gca,'Ylabel'),'position');
value_y=pos_y(1);
set(get(gca,'Ylabel'),'position',pos_y);
%pos(1)=0.08;
%pos(3)=0.6;
set(gca, 'Position', pos);
set(gca,'xtick',[]);
h(2)=subplot(pn,1,2);
plot(A,'g');
ylabel(yll,'FontSize',16);
set(get(gca, 'YLabel'), 'Rotation', 0);
pos = get(gca, 'Position');
 pos_y=get(get(gca,'Ylabel'),'position');
    pos_y(1)=value_y;
    set(get(gca,'Ylabel'),'position',pos_y);
%pos(1)=0.08;
%pos(3)=0.6;
set(gca, 'Position', pos);
set(gca,'xtick',[]);
for i=1:cs-1
    h(i+2)=subplot(pn,1,i+2);
    plot(D{i});
    ylabel(yxs{i},'FontSize',16);
    set(get(gca, 'YLabel'), 'Rotation', 0);
    pos = get(gca, 'Position');
    pos_y=get(get(gca,'Ylabel'),'position');
    pos_y(1)=value_y;
    set(get(gca,'Ylabel'),'position',pos_y);
    %pos(1)=0.08;
    %pos(3)=0.6;
    set(gca, 'Position', pos);
    set(gca,'xtick',[]);
end
h(cs+2)=subplot(pn,1,cs+2);
plot(D{cs});
ylabel(yxs{cs},'FontSize',16);
set(get(gca, 'YLabel'), 'Rotation', 0);
pos = get(gca, 'Position');
 pos_y=get(get(gca,'Ylabel'),'position');
    pos_y(1)=value_y;
    set(get(gca,'Ylabel'),'position',pos_y);
%pos(1)=0.08;
%pos(3)=0.6;
set(gca, 'Position', pos);
cd=1; 
kz=1;
% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global kz;
axes(handles.uipanel12);
%{
if kz~=1
   axes(handles.axes15);
end
%}
global h;
global cd;
global H;
global cs;
global cz_data;
t=cz_data(:,1);
z=cz_data(:,2);
[c,a,b]=emd(z);
A=a;
B=b;
%计算每个IMF分量及最后一个剩余分量residual与原始信号的相关性
[m,n]=size(c)%m=5分解为5个信号（包括残余分量）,n=2048
for i=1:m
a=corrcoef(c(i,:),z);
xg(i)=a(1,2);
end
xg;
if cd==1
    for i=1:cs+2
       delete(h(i));
    end
end

   %计算各IMF的方差贡献率
%定义：方差为平方的均值减去均值的平方
%均值的平方
%imfp2=mean(c(i,:),2).^2
%平方的均值
%imf2p=mean(c(i,:).^2,2)
%各个IMF的方差
for i=1:m-1
mse(i)=mean(c(i,:).^2,2)-mean(c(i,:),2).^2;
end;
mmse=sum(mse);
for i=1:m-1
mse(i)=mean(c(i,:).^2,2)-mean(c(i,:),2).^2; 
%方差百分比，也就是方差贡献率
mseb(i)=mse(i)/mmse*100;
%显示各个IMF的方差和贡献率
end;
%输出imf[i]的方差与贡献率
for i=1:m-1
disp(['imf',int2str(i)]) ;disp([mse(i) mseb(i)]);
end;
%画出每个IMF分量及最后一个剩余分量residual的图形

H(1)=subplot(m+1,1,1);
plot(t,z);
title('经验模态分解');
set(gca,'xtick',[]);
set(get(gca, 'YLabel'), 'Rotation', 0);
pos = get(gca, 'Position');
%pos(1)=0.08;
%pos(3)=0.6;
set(gca, 'Position', pos);
%set(gca,'fontname','times New Roman')%表明字体等，可不用
%set(gca,'fontsize',14.0)
ylabel('s  ')

%set(hc2(3), 'Position', [0 0 0]);
%画出imf[i]的图形
for i=1:m-1
H(i+1)=subplot(m+1,1,i+1);
%set(gcf,'color','w')
plot(t,c(i,:),'k')
set(gca,'xtick',[]);
set(get(gca, 'YLabel'), 'Rotation', 0);
pos = get(gca, 'Position');
%pos(1)=0.08;
%pos(3)=0.6;
set(gca, 'Position', pos);
set(gca,'fontname','times New Roman')
%set(gca,'fontsize',14.0)
ylabel(['imf',int2str(i),'    '])
end
%画残余分量
H(m+1)=subplot(m+1,1,m+1);
%set(gcf,'color','w')
plot(t,c(m,:),'k')
set(get(gca, 'YLabel'), 'Rotation', 0);
pos = get(gca, 'Position');
%pos(1)=0.08;
%pos(3)=0.6;
set(gca, 'Position', pos);
set(gca,'fontname','times New Roman')
%set(gca,'fontsize',14.0)
ylabel(['r',int2str(m-1),'     ']);
cd=2;
kz=2;
% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data_lhcc;
global n_s;
[X,XXX,X1,X2,X3]=gmwc(data_lhcc,n_s);
x=data_lhcc(:,1);
y1=X3;
y2=mean(X1,2);
y3=mean(X2,2);
y1=y1';
fid=fopen('E:\2.txt','w');
for i=1:length(x)
    fprintf(fid,'%.5f %.5f %.5f %.5f\n',x(i),y1(i),y2(i),y3(i));
end
fclose(fid);
axes(handles.axes10);
if get(handles.radiobutton4,'value')
    plot(x,X3,'k');
    title('Stacking');
    gmwc_lx=get(handles.radiobutton4,'string');
elseif get(handles.radiobutton5,'value')
    plot(x,mean(X1,2),'r');
    title('PCA');
    gmwc_lx=get(handles.radiobutton5,'string');
elseif get(handles.radiobutton6,'value')
    plot(x,mean(X2,2),'b');
    title('KLE');
    gmwc_lx=get(handles.radiobutton6,'string');
end


global kzt;
gmwc_kzt=['>>共模误差提取成功','(',gmwc_lx,')','(',datestr(now),')',10];
%gmwc_kzt=sprintf('\n%s',gmwc_kzt);
kzt=[kzt,gmwc_kzt];
%kzt=sprintf('%s\n',kzt);
set(handles.edit2,'string',kzt);
%{
figure;
x=data_lhcc(:,1);
subplot(2,2,1);
plot(x,mean(X1,2),'r');
title('PCA');
subplot(2,2,2);
plot(x,mean(X2,2),'b');
title('KLE');
K=X-X1;
subplot(2,2,3);
plot(x,X3,'k');
zoom on;
title('Stacking');
subplot(2,2,4);
plot(x,mean(X1,2),'r.');
zoom on;
hold on;
plot(x,mean(X2,2),'b.');
plot(x,X3,'k-');
legend({'PCA','KLE','Stacking'},'Location','Best');
legend('boxoff');
title('混合');
%}
% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
set(handles.radiobutton4,'value',1);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',1);
set(handles.radiobutton6,'value',0);


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',1);


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton4,'background',[0.94 0.94 0.94]);
set(handles.pushbutton5,'background',[0.94 0.94 0.94]);
set(handles.pushbutton6,'background',[0.94 0.94 0.94]);
set(handles.pushbutton20,'background','white');
set(handles.uipanel12,'visible','on');


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipushtool11_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('converson_format');


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('converson_format');
