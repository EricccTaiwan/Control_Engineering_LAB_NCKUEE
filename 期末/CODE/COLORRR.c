

task main(){
string colorOfObject;
repeat(forever){
	//�p�GPort3���C��Sensor��������⪫��
	if(getColorName(S2) == colorRed){
		colorOfObject = "RED";
		displayTextLine(2,"%s",colorOfObject);
		delay(10);
	}

	//�p�GPort3���C��Sensor�������Ū���A
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
