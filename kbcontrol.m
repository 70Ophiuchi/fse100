global key
InitKeyboard();

while 1
    pause(0.1);

    switch key

        case 'uparrow'

            brick.MoveMotor('AB', -20);

        case 'downarrow'

            brick.MoveMotor('AB', 20)

        case 'leftarrow'

            brick.MoveMotor('A', 40)
            brick.MoveMotor('B', -20)

        case 'rightarrow'

            brick.MoveMotor('B', 40)
            brick.MoveMotor('A', -20)

        case 0

            brick.StopMotor('AB', 'Coast')

        case 'u'

            brick.MoveMotorAngleRel('D', 10, 30, 'Brake')

        case 'i'

            brick.MoveMotorAngleRel('D', 10, -30, 'Brake')

        case 'q'

            break

    end

end

CloseKeyboard();
