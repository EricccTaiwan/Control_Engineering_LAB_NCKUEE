

task main(){
string colorOfObject;
repeat(forever){
	//如果Port3的顏色Sensor偵測到紅色物體
	if(getColorName(S2) == colorRed){
		colorOfObject = "RED";
		displayTextLine(2,"%s",colorOfObject);
		delay(10);
	}

	//如果Port3的顏色Sensor偵測到藍物體，
	else if(getColorName(S2) == colorBlue){
		//Store the text Blue into the color string
		colorOfObject = "BLUE";
		displayTextLine(2,"%s",colorOfObject);
		delay(10);
	}
	else{
		displayTextLine(2,"%d",getColorName(S2);
		delay(10);
	}
}


}
