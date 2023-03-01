global key

brick = ConnectBrick('H')

% brick.SetColorMode(2, 2);
% 1	Black
% 2	Blue
% 3	Green
% 4	Yellow
% 5	Red
% 6	White
% 7	 Brown

while true

    touch = brick.TouchPressed(1);
    color = brick.ColorCode(2);
    distance = brick.UltrasonicDist(3);

    if color == 1

        if ~touch && distance > 5
            brick.MoveMotor('AB', 20);

        else
            brick.MoveMotor('AB', 0);

            if brick.UltrasonicDist(3) > 10
                brick.MoveMotor('AB', -20);
                pause(1);
                brick.MoveMotor('AB', 0);
                brick.MoveMotor('B', -20);
                brick.MoveMotor('A', 10);
                pause(2);
                brick.MoveMotor('AB', 0)
            else
                brick.MoveMotor('AB', -20);
                pause(1);
                brick.MoveMotor('AB', 0);
                brick.MoveMotor('A', -20);
                brick.MoveMotor('B', 10);
                pause(2);
                brick.MoveMotor('AB', 0)
            end

        end

    elseif color == 5
        brick.StopMotor('AB', 'Coast');
        pause(2);
        brick.MoveMotor('AB', 20);
    elseif color == 4 || color == 3
        brick.StopMotor('AB', 'Coast');
        InitKeyboard();

        while 1

            switch key

                case 'uparrow'

                    brick.MoveMotor('AB', 20);

                case 'downarrow'

                    brick.StopMotor('AB', 'Coast')

                case 'leftarrow'

                    brick.MoveMotor('A', 40)
                    brick.MoveMotor('B', -20)

                case 'rightarrow'

                    brick.MoveMotor('B', 40)
                    brick.MoveMotor('A', -20)

                case 0

                    brick.StopMotor('AB', 'Coast')

                case 'q'

                    break

            end

        end
        
        CloseKeyboard();

    end

end
