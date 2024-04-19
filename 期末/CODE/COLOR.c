
task main()
{
resetGyro(S2);

//一直重複執行轉向直到陀
repeatUntil(getGyroDegrees(S2) > 90)
{
	//左
	setMotorSpeed(motorC, -50);
	setMotorSpeed(motorB, 50);
}

//停止
setMotorSpeed(motorB, 0);
setMotorSpeed(motorC, 0);



}
