
task main()
{
resetGyro(S2);

//�@�����ư�����V�����
repeatUntil(getGyroDegrees(S2) > 90)
{
	//��
	setMotorSpeed(motorC, -50);
	setMotorSpeed(motorB, 50);
}

//����
setMotorSpeed(motorB, 0);
setMotorSpeed(motorC, 0);



}
