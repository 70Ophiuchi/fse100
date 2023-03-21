global key

fwspeed = -40
bwspeed = 40
motors = 'AB'
pick = 'D'
dt = 30

while 1

    brick.MoveMotor(motors, fwspeed);

    touch = brick.TouchPressed(1);
    color = brick.ColorCode(2);
    distance = brick.UltrasonicDist(3);

    if distance > dt
        brick.StopMotor(motors, 'Coast');
        brick.MoveMotor('A', -30);
        brick.MoveMotor('B', 10);
        pause(2)
        brick.StopMotor(motors, 'Coast');
        brick.MoveMotor(motors, fwspeed);
    end

    if touch

        brick.StopMotor(motors, 'Coast');
        brick.MoveMotor(motors, bwspeed);
        pause(0.5);
        brick.StopMotor(motors, 'Coast');
        brick.MoveMotor('A', 10);
        brick.MoveMotor('B', -30);
        pause(2);
        brick.StopMotor(motors, 'Coast');
        brcik.MoveMotor(motors, fwspeed);
    end

    if color == 5
        brick.StopMotor(motors, 'Coast');
        pause(3);
        brick.MoveMotor(motors, fwspeed);
        pause(2);

    elseif color == 4 || color == 3

        brick.StopMotor('AB', 'Coast');

        InitKeyboard();

        while 1
            pause(0.1);

            switch key

                case 'uparrow'

                    brick.MoveMotor(motors, fwspeed);

                case 'downarrow'

                    brick.MoveMotor(motors, bwspeed);

                case 'leftarrow'

                    brick.MoveMotor('A', 30);
                    brick.MoveMotor('B', -10);

                case 'rightarrow'

                    brick.MoveMotor('A', -10);
                    brick.MoveMotor('B', 30);

                case 0

                    brick.StopMotor(motors, 'Coast');
                    brick.StopMotor('D', 'Brake')

                case 'w'

                    brick.MoveMotor('D', -10)

                case 'd'

                    brick.MoveMotor('D', 10)

                case 'q'

                    break;
            end

        end

        CloseKeyboard();
    end

end
