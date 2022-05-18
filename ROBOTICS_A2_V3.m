%% Set Script
clear all
close all
clc
startup_rvc
set(0,'DefaultFigureWindowStyle','docked')
hold on
app = ESTOP_GUI;

%% Variables
workspace = [-3 3 -2 2 0 4];  %define figure workspaceBase
scale = 100;
scale1 = 0.5;
LightCurtainDetect = 0;

%/
% Setting variables robot location and orientation
%\
base = transl (0.4,0.24,0.87);    
orientation = trotz(pi);

%/
% Setting variables for containers, cap frequencies used in sensor and
% default option used in sensorF
%\
greenContainer = transl (0.2,0.5,0.87);         
blueContainer = transl (0.6,0.5,0.87);
redContainer = transl (0.4,0.5,0.87);
greenContainerDrop = transl (0.2,0.46,0.87);
blueContainerDrop = transl (0.6,0.5,0.87);
redContainerDrop = transl (0.4,0.5,0.96);
sensor = transl (0,0,0) * trotz(pi/2);
frequency1 = 1000; %Red
frequency2 = 500;  %Blue    
frequency3 = 150;  %Green

cap1F = frequency1;
cap2F = frequency2;
cap3F = frequency3;

option = 0;


robotTag = 'Robot_DoBot';

%% Create Environment 

% create objects either using varaible previosuly defined  or transl
surf([-3,-3;3,3],[-3,3;-3,3],[0.01,0.01;0.01,0.01],'CData',imread('polishedConcreteFloor.jpeg'),'FaceColor','texturemap');
surf([3,-3], [-3,-3], [4,4;0.01,0.01],'CData',imread('cartoonwall3.jpg'),'FaceColor','texturemap');
surf([-3,-3], [-3,3], [0.01,0.01;2,2],'CData',imread('cartoonwall3.jpg'),'FaceColor','texturemap');


%% Plot PLYs in simulation 
%/
% Name of mesh eg mesh_WorkBench describes the mesh that is being placed
%\ 
mesh_Workbench = PlaceObject('WORKBENCH-PLY-SCALED4.ply');
vertices_Workbench = get(mesh_Workbench,'Vertices');
transformedVertices_Workbench = [vertices_Workbench,ones(size(vertices_Workbench,1),1)] * transl(0,0.2,0)';
set(mesh_Workbench, 'Vertices', transformedVertices_Workbench(:, 1:3));
camlight

mesh_Workbench = PlaceObject('First_Aid.ply');
vertices_Workbench = get(mesh_Workbench,'Vertices');
transformedVertices_Workbench = [vertices_Workbench,ones(size(vertices_Workbench,1),1)] * transl(0,0.2,0)';
set(mesh_Workbench, 'Vertices', transformedVertices_Workbench(:, 1:3));
camlight

mesh_fireExtinguisher = PlaceObject('fire_extinguisher.ply');
vertices_fireExtinguisher = get(mesh_fireExtinguisher,'Vertices');
transformedVertices_fireExtinguisher = [vertices_fireExtinguisher,ones(size(vertices_fireExtinguisher,1),1)] * transl(-1.5,1.5,0.45)';
set(mesh_fireExtinguisher, 'Vertices', transformedVertices_fireExtinguisher(:, 1:3));
camlight

mesh_3dPrinter = PlaceObject('3DPrinterPaintedSCALED.ply');
vertices_3dPrinter = get(mesh_3dPrinter,'Vertices');
transformedVertices_3dPrinter = [vertices_3dPrinter,ones(size(vertices_3dPrinter,1),1)] * transl(-0.35,0.25,0.87)';
set(mesh_3dPrinter, 'Vertices', transformedVertices_3dPrinter(:, 1:3));
camlight

% Containers
mesh_containerBlue = PlaceObject('ContainerBLUE3.ply');
vertices_containerBlue = get(mesh_containerBlue,'Vertices');
transformedVertices_containerBlue = [vertices_containerBlue,ones(size(vertices_containerBlue,1),1)] * blueContainer';
set(mesh_containerBlue, 'Vertices', transformedVertices_containerBlue(:, 1:3));
camlight

mesh_containerRed = PlaceObject('ContainerRED3.ply');
vertices_containerRed = get(mesh_containerRed,'Vertices');
transformedVertices_containerRed = [vertices_containerRed,ones(size(vertices_containerRed,1),1)] * redContainer';
set(mesh_containerRed, 'Vertices', transformedVertices_containerRed(:, 1:3));
camlight

mesh_containerGreen = PlaceObject('ContainerGREEN3.ply');
vertices_containerGreen = get(mesh_containerGreen,'Vertices');
transformedVertices_containerGreen = [vertices_containerGreen,ones(size(vertices_containerGreen,1),1)] * greenContainer';
set(mesh_containerGreen, 'Vertices', transformedVertices_containerGreen(:, 1:3));
camlight


% Sensors, Buttons, extras

mesh_colourSensor = PlaceObject('colourSensor2.ply');
vertices_colourSensor = get(mesh_colourSensor,'Vertices');
transformedVertices_colourSensor = [vertices_colourSensor,ones(size(vertices_colourSensor,1),1)] * transl(0.1,0,0.87)';
set(mesh_colourSensor, 'Vertices', transformedVertices_colourSensor(:, 1:3));
camlight


mesh_containerGreen = PlaceObject('eStopButton2.ply');
vertices_containerGreen = get(mesh_containerGreen,'Vertices');
transformedVertices_containerGreen = [vertices_containerGreen,ones(size(vertices_containerGreen,1),1)] * transl(-0.3,0.75,0.87)';
set(mesh_containerGreen, 'Vertices', transformedVertices_containerGreen(:, 1:3));
camlight


mesh_containerGreen = PlaceObject('resetButton2.ply');
vertices_containerGreen = get(mesh_containerGreen,'Vertices');
transformedVertices_containerGreen = [vertices_containerGreen,ones(size(vertices_containerGreen,1),1)] * transl(-0.45,0.75,0.87)';
set(mesh_containerGreen, 'Vertices', transformedVertices_containerGreen(:, 1:3));
camlight

mesh_containerGreen = PlaceObject('startButton2.ply');
vertices_containerGreen = get(mesh_containerGreen,'Vertices');
transformedVertices_containerGreen = [vertices_containerGreen,ones(size(vertices_containerGreen,1),1)] * transl(-0.6,0.75,0.87)';
set(mesh_containerGreen, 'Vertices', transformedVertices_containerGreen(:, 1:3));
camlight

mesh_worker3 = PlaceObject('worker4.ply');
vertices_worker3 = get(mesh_worker3,'Vertices');
transformedVertices_worker3 = [vertices_worker3,ones(size(vertices_worker3,1),1)] * transl(0,1.5,1)';
set(mesh_worker3, 'Vertices', transformedVertices_worker3(:, 1:3));
camlight

mesh_lightcurtainleft = PlaceObject('LightCurtainL.ply');
vertices_lightcurtainleft = get(mesh_lightcurtainleft,'Vertices');
transformedVertices_lightcurtainleft = [vertices_lightcurtainleft,ones(size(vertices_lightcurtainleft,1),1)] * transl(0.8,0.65,0.87)';
set(mesh_lightcurtainleft, 'Vertices', transformedVertices_lightcurtainleft(:, 1:3));
camlight

mesh_lightcurtainright = PlaceObject('LightCurtainR.ply');
vertices_lightcurtainright = get(mesh_lightcurtainright,'Vertices');
transformedVertices_lightcurtainright = [vertices_lightcurtainright,ones(size(vertices_lightcurtainright,1),1)] * transl(-0.8,0.65,0.87)';
set(mesh_lightcurtainright, 'Vertices', transformedVertices_lightcurtainright(:, 1:3));
camlight




% Oil Caps

mesh_oilCapRed = PlaceObject('OilcapREDSCALED.ply');
vertices_oilCapRed = get(mesh_oilCapRed,'Vertices');
transformedVertices_oilCapRed = [vertices_oilCapRed,ones(size(vertices_oilCapRed,1),1)] * transl(-0.63,0.24,0.938)';
set(mesh_oilCapRed, 'Vertices', transformedVertices_oilCapRed(:, 1:3));
camlight



mesh_oilCapBlue = PlaceObject('OilcapBLUESCALED.ply');
vertices_oilCapBlue = get(mesh_oilCapBlue,'Vertices');
transformedVertices_oilCapBlue = [vertices_oilCapBlue,ones(size(vertices_oilCapBlue,1),1)] * transl(-0.27,0.24,0.938)';
set(mesh_oilCapBlue, 'Vertices', transformedVertices_oilCapBlue(:, 1:3));
camlight


    %% DH parameters taken from Universal robots spec sheet 
            L1 = Link('d', 0.139, 'a', 0, 'alpha', pi/2, 'qlim', [-2*pi, 2*pi]);
            L2 = Link('d', 0,'a', 0.138, 'alpha', 0, 'qlim', [-2*pi, 2*pi]);
            L3 = Link('d', 0, 'a', 0.164, 'alpha', 0, 'qlim', [-2*pi, 2*pi]);
            L4 = Link('d', 0, 'a', 0.065, 'alpha', -pi/2, 'qlim', [-2*pi, 2*pi]);
            L5 = Link('d', -0.07, 'a', 0, 'alpha', 0, 'qlim', [-2*pi, 2*pi]);

    
    
    Robot_DoBot = SerialLink([L1 L2 L3 L4 L5],'name',robotTag, 'base', base*orientation); %set robot base location and orientation
    qguess = [0 pi/4 -pi/6 0 0];




    %% Plot the UR3 design

   %/
   % Links the ply 'skin' for DOBOT to each link allowing singular
   % expression to allow all components to move in unity
   %\
    for linkno = 0:Robot_DoBot.n
        drawnow();
        [ faceData, vertexData, plyData{linkno+1} ] = plyread(['DobotLink',num2str(linkno),'.ply'],'tri'); 
        Robot_DoBot.faces{linkno+1} = faceData;
        Robot_DoBot.points{linkno+1} = vertexData;
    end
    
    % Display robot
    Robot_DoBot.plotopt3d = {'wrist', 'xyz', 'arrow'};
    Robot_DoBot.plot3d(qguess, 'workspace',[-2 2 -2 2 0 2], 'scale', scale)
    if isempty(findobj(get(gca,'Children'),'Type','Light'))
        camlight
    end
     Robot_DoBot.delay = 0;

while(1)
    
disp('Push Start Button To Continue');       %Safety feature to not allow robots to move until people are clear of work zone
    uiwait;     

%% NORMAL MODE
if (app.SwitchStatus == 0) 
    disp('Normal Mode');      
      
    drawnow();
%/
% Created here and modifed later to be used other steps
% Increments a set step value increasing by distance 0.03 every step by
% deleting then animating the oil caps along the conveyor. At the end a new
% can is spawned/ printed under the 3D printer
%\

steps = 12;
r = -0.63;
b = -0.27;
g = -0.63;


for i =  1:steps
    
    drawnow();

    r = r + 0.03;
    b = b + 0.03;

    
     try delete (mesh_oilCapRed);
         delete (mesh_oilCapBlue);
     end

     CapRS = transl(r,0.24,0.938);
     CapBS = transl(b,0.24,0.938);
     CapGS = transl(-0.63,0.24,0.938);
    

mesh_oilCapRed = PlaceObject('OilcapREDSCALED.ply');
vertices_oilCapRed = get(mesh_oilCapRed,'Vertices');
transformedVertices_oilCapRed = [vertices_oilCapRed,ones(size(vertices_oilCapRed,1),1)] * CapRS';
set(mesh_oilCapRed, 'Vertices', transformedVertices_oilCapRed(:, 1:3));



mesh_oilCapBlue = PlaceObject('OilcapBLUESCALED.ply');
vertices_oilCapBlue = get(mesh_oilCapBlue,'Vertices');
transformedVertices_oilCapBlue = [vertices_oilCapBlue,ones(size(vertices_oilCapBlue,1),1)] * CapBS';
set(mesh_oilCapBlue, 'Vertices', transformedVertices_oilCapBlue(:, 1:3));

pause(0.001)

end

mesh_oilCapGreen = PlaceObject('OilcapGREENSCALED.ply');
vertices_oilCapGreen = get(mesh_oilCapGreen,'Vertices');
transformedVertices_oilCapGreen = [vertices_oilCapGreen,ones(size(vertices_oilCapGreen,1),1)] * CapGS';
set(mesh_oilCapGreen, 'Vertices', transformedVertices_oilCapGreen(:, 1:3));

%/
% Not used due to limitations but was designed to scan if cap is within
% colour sensor range before colour scan is completed
%\

% %% Senserange
% picklocation = transl(0.09,0.24,0.938);
% cap1_1 = CapGS;
% cap2_1 = CapBS;
% cap3_1 = CapRS;
% 
% if Cap1_1 || Cap2_1 || Cap3_1 == picklocation
%     disp("Cap Located")
%     senserange = true
% else 
%     senserange = false
% end
% 

%% Cap1

%/
% Checks Cap at the end of the conveyors frequency and determines based on
% its frequency what colour it is to decide where it needs to go
%\ 

frequency = cap2F;

    if frequency <= 250
        disp('Green Cap')
        option = 3;
    end
    if frequency <= 750 && frequency > 250 
        disp('Blue Cap')
        option = 2;
    end 
    if frequency > 750 
        disp('Red Cap')
        option = 1;
    end


%/
% Finds current location and next end effector goal pose based on pick up
% loaction, to then be animated in a 50 step loop to animate a moving arm
% using ikine
%\

initialPickup = transl(0.09,0.24,0.938);
x = Robot_DoBot.getpos      ;                                     
q1 = x;                                        %Current position of UR3                                                                             
q2 = Robot_DoBot.ikine(initialPickup,qguess,[1 1 1 0 0 0]);               %Next goal position of UR3

stepper = 50;                                   %Number of steps to split the animation of the robots movement into
                     

qMatrix = jtraj(q1,q2,stepper);



for i =  1:stepper                                %Animates the both robot movements simultanously from steps 1 to N
   
    drawnow();
    Robot_DoBot.animate(qMatrix(i,:))                  
  pause(0.1)
end 




%/
% Gets Dobots current postion and uses the determined option from colour
% sensor to allocate a drop of location to assign to the end effector goal
% pose, followed by the cap being moved into the container
%\

x = Robot_DoBot.getpos;
q1 = x;
stepper = 50;

if option == 3
    q2 = Robot_DoBot.ikine(greenContainerDrop,qguess, [1 1 1 0 0 0]);  
end
if option == 2
    q2 = Robot_DoBot.ikine(blueContainer,qguess,[1 1 1 0 0 0]);
end
if option == 1
    q2 = Robot_DoBot.ikine(redContainerDrop,qguess, [1 1 1 0 0 0]);  
end

qMatrix = jtraj(q1,q2,stepper);

for i =  1:stepper                               %Animates the robot movement from steps 1 to N
   drawnow();
    
    Robot_DoBot.animate(qMatrix(i,:))  
  
   pause(0.1)
end

try delete (mesh_oilCapBlue);                    %removes cap now goal position has been achieved
end


mesh_oilCapBlue = PlaceObject('OilcapBLUESCALED.ply');
vertices_oilCapBlue = get(mesh_oilCapBlue,'Vertices');
transformedVertices_oilCapBlue = [vertices_oilCapBlue,ones(size(vertices_oilCapBlue,1),1)] * blueContainer';
set(mesh_oilCapBlue, 'Vertices', transformedVertices_oilCapBlue(:, 1:3));

%% Cap 2
steps = 12;
r = -0.27;
b = -0.63;
g = -0.63;


for i =  1:steps
drawnow();
    r = r + 0.03;
    g = g + 0.03;
    
     try delete (mesh_oilCapRed);
         delete (mesh_oilCapGreen);
     end

     CapRS = transl(r,0.24,0.938);
     CapBS = transl(-0.63,0.24,0.938);
     CapGS = transl(g,0.24,0.938);
    

mesh_oilCapRed = PlaceObject('OilcapREDSCALED.ply');
vertices_oilCapRed = get(mesh_oilCapRed,'Vertices');
transformedVertices_oilCapRed = [vertices_oilCapRed,ones(size(vertices_oilCapRed,1),1)] * CapRS';
set(mesh_oilCapRed, 'Vertices', transformedVertices_oilCapRed(:, 1:3));

mesh_oilCapGreen = PlaceObject('OilcapGREENSCALED.ply');
vertices_oilCapGreen = get(mesh_oilCapGreen,'Vertices');
transformedVertices_oilCapGreen = [vertices_oilCapGreen,ones(size(vertices_oilCapGreen,1),1)] * CapGS';
set(mesh_oilCapGreen, 'Vertices', transformedVertices_oilCapGreen(:, 1:3));


pause(0.001)

end

mesh_oilCapBlue = PlaceObject('OilcapBLUESCALED.ply');
vertices_oilCapBlue = get(mesh_oilCapBlue,'Vertices');
transformedVertices_oilCapBlue = [vertices_oilCapBlue,ones(size(vertices_oilCapBlue,1),1)] * CapBS';
set(mesh_oilCapBlue, 'Vertices', transformedVertices_oilCapBlue(:, 1:3));




frequency = cap1F;

    if frequency <= 250
        disp('Green Cap')
        option = 3;
    end
    if frequency <= 750 && frequency > 250 
        disp('Blue Cap')
        option = 2;
    end 
    if frequency > 750 
        disp('Red Cap')
        option = 1;
    end





%%Robot arm move
x = Robot_DoBot.getpos;                                           
q1 = x;                                        %Current position of UR3                                                                             
q2 = Robot_DoBot.ikine(CapRS,qguess, [1 1 1 0 0 0]);               %Next goal position of UR3

stepper = 50;                                   %Number of steps to split the animation of the robots movement into

Robot_DoBot.fkine(q2);                                %displays joint configuration expected to achieve goal UR3
                     

qMatrix = jtraj(q1,q2,stepper);



for i =  1:stepper                                %Animates the both robot movements simultanously from steps 1 to N
   drawnow();
    Robot_DoBot.animate(qMatrix(i,:));                  
    pause(0.1)
end 





x = Robot_DoBot.getpos;
q1 = x;
stepper = 50;



if option == 3
    q2 = Robot_DoBot.ikine(greenContainerDrop,qguess, [1 1 1 0 0 0]); 
end
if option == 2
    q2 = Robot_DoBot.ikine(blueContainerDrop,qguess, [1 1 1 0 0 0]);
end
if option == 1
    q2 = Robot_DoBot.ikine(redContainerDrop,qguess, [1 1 1 0 0 0]);    
end

qMatrix = jtraj(q1,q2,stepper);

for i =  1:stepper                               %Animates the both robot movements simultanously from steps 1 to N
   drawnow();
    
    Robot_DoBot.animate(qMatrix(i,:)) 
   pause(0.1)
end

try delete (mesh_oilCapRed);                    %removes bricks now goal position has been achieved
end


mesh_oilCapRed = PlaceObject('OilcapREDSCALED.ply');
vertices_oilCapRed = get(mesh_oilCapRed,'Vertices');
transformedVertices_oilCapRed = [vertices_oilCapRed,ones(size(vertices_oilCapRed,1),1)] * redContainer';
set(mesh_oilCapRed, 'Vertices', transformedVertices_oilCapRed(:, 1:3));




%% Cap 3


steps = 12;
r = -0.63;
b = -0.63;
g = -0.27;


for i =  1:steps
drawnow();
    b = b + 0.03;
    g = g + 0.03;
    
     try delete (mesh_oilCapBlue);
         delete (mesh_oilCapGreen);
     end

     CapRS = transl(-0.63,0.24,0.938);
     CapBS = transl(b,0.24,0.938);
     CapGS = transl(g,0.24,0.938);
    
mesh_oilCapBlue = PlaceObject('OilcapBLUESCALED.ply');
vertices_oilCapBlue = get(mesh_oilCapBlue,'Vertices');
transformedVertices_oilCapBlue = [vertices_oilCapBlue,ones(size(vertices_oilCapBlue,1),1)] * CapBS';
set(mesh_oilCapBlue, 'Vertices', transformedVertices_oilCapBlue(:, 1:3));

mesh_oilCapGreen = PlaceObject('OilcapGREENSCALED.ply');
vertices_oilCapGreen = get(mesh_oilCapGreen,'Vertices');
transformedVertices_oilCapGreen = [vertices_oilCapGreen,ones(size(vertices_oilCapGreen,1),1)] * CapGS';
set(mesh_oilCapGreen, 'Vertices', transformedVertices_oilCapGreen(:, 1:3));


pause(0.001)

end

mesh_oilCapRed = PlaceObject('OilcapREDSCALED.ply');
vertices_oilCapRed = get(mesh_oilCapRed,'Vertices');
transformedVertices_oilCapRed = [vertices_oilCapRed,ones(size(vertices_oilCapRed,1),1)] * CapRS';
set(mesh_oilCapRed, 'Vertices', transformedVertices_oilCapRed(:, 1:3));





%Switch to detect colour frequency
frequency = cap3F;

    if frequency <= 250
        disp('Green Cap')
        option = 3;
    end
    if frequency <= 750 && frequency > 250 
        disp('Blue Cap')
        option = 2;
    end 
    if frequency > 750 
        disp('Red Cap')
        option = 1;
    end





%%Robot arm move
x = Robot_DoBot.getpos ;                                          
q1 = x; %Current position of UR3                                                                             
q2 = Robot_DoBot.ikine(CapGS,qguess, [1 1 1 0 0 0]); %Next goal position of UR3

stepper = 50; %Number of steps to split the animation of the robots movement into
                     

qMatrix = jtraj(q1,q2,stepper);



for i =  1:stepper %Animates the both robot movements simultanously from steps 1 to N
   drawnow();
    Robot_DoBot.animate(qMatrix(i,:))                  
    pause(0.1)
end 








x = Robot_DoBot.getpos;
q1 = x;
stepper = 50;



if option == 3
    q2 = Robot_DoBot.ikine(greenContainerDrop,qguess, [1 1 1 0 0 0]);  
end
if option == 2
    q2 = Robot_DoBot.ikine(blueContainerDrop,qguess, [1 1 1 0 0 0]);
end
if option == 1
    q2 = Robot_DoBot.ikine(redContainerDrop,qguess, [1 1 1 0 0 0]);    
end

qMatrix = jtraj(q1,q2,stepper);

for i =  1:stepper                               %Animates the both robot movements simultanously from steps 1 to N
  drawnow();
    Robot_DoBot.animate(qMatrix(i,:)) 
   pause(0.1)
end

try delete (mesh_oilCapGreen);                    %removes bricks now goal position has been achieved
end


mesh_oilCapGreen = PlaceObject('OilcapGREENSCALED.ply');
vertices_oilCapGreen = get(mesh_oilCapGreen,'Vertices');
transformedVertices_oilCapGreen = [vertices_oilCapGreen,ones(size(vertices_oilCapGreen,1),1)] * greenContainer';
set(mesh_oilCapGreen, 'Vertices', transformedVertices_oilCapGreen(:, 1:3));

end

%% LIGHT CURTAIN MODE
%/
% Mode that allows for demonstration of functioning light curtain which
% stops the operation when an object is detected passing through the light
% curtains
%\ 

if (app.SwitchStatus == 1)
    while(app.SwitchStatus == 1)
        steps = 35;
        y = 1.5;
       
         r = -0.63;
         b = -0.27;
         g = -0.63;
            
        for i =  1:steps
            drawnow();

            y = y - 0.03;
            
            if (app.LightCurtainDetect == 0)
                 r = r + 0.008;
                 b = b + 0.008;
                 CapRS = transl(r,0.24,0.938);
                 CapBS = transl(b,0.24,0.938);
                 CapGS = transl(-0.63,0.24,0.938);
            end

             try 
                 
                 delete (mesh_worker3);
                 delete (mesh_oilCapRed);
                 delete (mesh_oilCapBlue);

             end

            workerMove = transl(-0,y,1);

            mesh_worker3 = PlaceObject('worker4.ply');
            vertices_worker3 = get(mesh_worker3,'Vertices');
            transformedVertices_worker3 = [vertices_worker3,ones(size(vertices_worker3,1),1)] * workerMove';
            set(mesh_worker3, 'Vertices', transformedVertices_worker3(:, 1:3));
            camlight
            
            mesh_oilCapRed = PlaceObject('OilcapREDSCALED.ply');
            vertices_oilCapRed = get(mesh_oilCapRed,'Vertices');
            transformedVertices_oilCapRed = [vertices_oilCapRed,ones(size(vertices_oilCapRed,1),1)] * CapRS';
            set(mesh_oilCapRed, 'Vertices', transformedVertices_oilCapRed(:, 1:3));


            mesh_oilCapBlue = PlaceObject('OilcapBLUESCALED.ply');
            vertices_oilCapBlue = get(mesh_oilCapBlue,'Vertices');
            transformedVertices_oilCapBlue = [vertices_oilCapBlue,ones(size(vertices_oilCapBlue,1),1)] * CapBS';
            set(mesh_oilCapBlue, 'Vertices', transformedVertices_oilCapBlue(:, 1:3));

            pause(0.0005)
            
            
            if (y < 0.6)
                disp('Light Curtain Detection')
                app.LightCurtainDetect = 1;
            end
        
        end 
      
        for i =  1:steps
            drawnow();

            y = y + 0.03;

             try 
                 delete (mesh_worker3);
                 delete (mesh_oilCapRed);
                 delete (mesh_oilCapBlue);
             end

             workerMove = transl(-0,y,1);
             
             if (app.LightCurtainDetect == 0)
                 r = r + 0.008;
                 b = b + 0.008;
                 CapRS = transl(r,0.24,0.938);
                 CapBS = transl(b,0.24,0.938);
                 CapGS = transl(-0.63,0.24,0.938);
            end

            mesh_worker3 = PlaceObject('worker4.ply');
            vertices_worker3 = get(mesh_worker3,'Vertices');
            transformedVertices_worker3 = [vertices_worker3,ones(size(vertices_worker3,1),1)] * workerMove';
            set(mesh_worker3, 'Vertices', transformedVertices_worker3(:, 1:3));
            camlight
            
            mesh_oilCapRed = PlaceObject('OilcapREDSCALED.ply');
            vertices_oilCapRed = get(mesh_oilCapRed,'Vertices');
            transformedVertices_oilCapRed = [vertices_oilCapRed,ones(size(vertices_oilCapRed,1),1)] * CapRS';
            set(mesh_oilCapRed, 'Vertices', transformedVertices_oilCapRed(:, 1:3));

            mesh_oilCapBlue = PlaceObject('OilcapBLUESCALED.ply');
            vertices_oilCapBlue = get(mesh_oilCapBlue,'Vertices');
            transformedVertices_oilCapBlue = [vertices_oilCapBlue,ones(size(vertices_oilCapBlue,1),1)] * CapBS';
            set(mesh_oilCapBlue, 'Vertices', transformedVertices_oilCapBlue(:, 1:3));

            pause(0.0005)
            
            if (y < 0.6)
                disp('Light Curtain Detection')
                app.LightCurtainDetect = 1;
            end
            
            
        end
    end
    
end


%% Manual MODE
%/
% Mode that allows for demonstration of GUI App control of the DoBot
% end effector and link configurations can be set using the GUI input 
%\

if (app.SwitchStatus == 2)
    
    disp('Manual Mode')
    
    P = Robot_DoBot.getpos;
    app.Q1 = rad2deg(P(1));
    app.Q2 = rad2deg(P(2));
    app.Q3 = rad2deg(P(3));
    app.Q4 = rad2deg(P(4));
    app.Q5 = rad2deg(P(5));
    
    app.Q1Slider.Value = rad2deg(P(1));
    app.Q2Slider.Value = rad2deg(P(2));
    app.Q3Slider.Value = rad2deg(P(3));
    app.Q4Slider.Value = rad2deg(P(4));
    app.Q5Slider.Value = rad2deg(P(5));
    
    tr = Robot_DoBot.fkine(P);
    cartesian = tr(1:3,4)';
    
    app.X = cartesian(1);
    app.Y = cartesian(2);
    app.Z = cartesian(3);
    
    app.XEditField.Value = cartesian(1);
    app.YEditField.Value = cartesian(2);
    app.ZEditField.Value = cartesian(3);
    
    
    while(app.SwitchStatus == 2)
    drawnow();
        if (app.SliderChanged == 1)
            P(1) = deg2rad(app.Q1);
            P(2) = deg2rad(app.Q2);
            P(3) = deg2rad(app.Q3);
            P(4) = deg2rad(app.Q4);
            P(5) = deg2rad(app.Q5);

            Robot_DoBot.plot(P);
             
            tr = Robot_DoBot.fkine(P);
            cartesian = tr(1:3,4)';
            app.X = cartesian(1);
            app.Y = cartesian(2);
            app.Z = cartesian(3);

            app.XEditField.Value = cartesian(1);
            app.YEditField.Value = cartesian(2);
            app.ZEditField.Value = cartesian(3);
            
            app.SliderChanged = 0;
        end    
        
        if (app.TextBoxChanged == 1)
            
            
            cartesian(1) = app.XEditField.Value;
            cartesian(2) = app.YEditField.Value;
            cartesian(3) = app.ZEditField.Value;
            
            tr = transl(cartesian);
            P = Robot_DoBot.ikine(tr,qguess, [1 1 1 0 0 0]);
            Robot_DoBot.plot(P);
            
            app.Q1 = rad2deg(P(1));
            app.Q2 = rad2deg(P(2));
            app.Q3 = rad2deg(P(3));
            app.Q4 = rad2deg(P(4));
            app.Q5 = rad2deg(P(5));
            
            app.Q1Slider.Value = rad2deg(P(1));
            app.Q2Slider.Value = rad2deg(P(2));
            app.Q3Slider.Value = rad2deg(P(3));
            app.Q4Slider.Value = rad2deg(P(4));
            app.Q5Slider.Value = rad2deg(P(5));
    
            app.TextBoxChanged = 0;
            
        end    
        
        
        
    end
    
    
    
    
end

end









