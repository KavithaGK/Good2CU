<?php
echo '<form id="bmi-form" style="color:black;">
	<h3 style="margin-bottom: 10px">BMI Calculator</h3>
    <div>
        <span>GENDER</span>
        <select name="Gender" id="gender" style="height: 40px">
            <option value="male">Boy</option>
            <option value="female">Girl</option>
        </select>
    </div>
    <div>
        <span>HEIGHT(cm)</span>
        <input type="text" id="height" name="height" class="number-input" style=" padding: 0px 0px 0px 10px">
        <span class="msg" style="display: none; color: blue"></span>
    </div>
    <div>
        <span>WEIGHT(kg)</span>
        <input type="text" id="weight" name="weight" class="number-input" style=" padding: 0px 0px 0px 10px">
        <span class="msg" style="display: none; color: blue"></span>
    </div>


       
    
    <span><button type="button" id="button-calculate" style="border-radius:5px; margin-top: 20px; background-color:#b1d6bb">Calculate your bmi</button></span>


<div id="result-content" style="display: none;background-color:#a9afcc">
        <span id="res-bmi"></span>
        <b><p><span id="res-health"></span></p></b>
<span><a href="http://good2cu.ml/index.php/hospital-locations/"><button type="button" id="doctor" style="border-radius:5px; margin-top: 20px; display: none;background-color:white;color:black">Consult Doctor</button></a></span>
    </div>
     
</form>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">

jQuery("body").on("click","#button-calculate",function(){
	ele = $("#height")
	var input_value = ele.val()
	if(input_value == "" || isNaN(input_value) || parseInt(input_value <= 0)){
		ele.siblings(".msg").html("please input an number greater than 0")
		ele.siblings(".msg").css("display", "inline-block")
		return
	}

	ele = $("#weight")
	var input_value = ele.val()
	if(input_value == "" || isNaN(input_value) || parseInt(input_value <= 0)){
		ele.siblings(".msg").html("please input an number greater than 0")
		ele.siblings(".msg").css("display", "inline-block")
		return
	}
	var gender = $("#gender").val()
	var weight = parseInt($("#weight").val())
	var height = parseInt($("#height").val())

	var bmi = Number(weight/(height * height)*10000).toFixed(2)
	if(gender == "male"){
		//todo calculate health level of male
		health = "male health"
	}else{
		//todo calculate health level of female
		health = "female health"
	}
	var Description = "";
            if (bmi<18.5)
	{
                Description ="Underweight - eat a bagel! Healthy BMI is 								between 18.5 and 24.99";
				document.getElementById("doctor").style.display = "block";
	}
            else if (bmi>=18.5 && bmi<=24.99)
	{
                Description ="Normal - keep it up!";
				document.getElementById("doctor").style.display = "none";
	}
            else if (bmi>=25 && bmi<=29.99)
	{
                Description ="Overweight - exercise more! Healthy BMI is 					between 18.5 and 24.99";
				document.getElementById("doctor").style.display = "block";
	}
            else if (bmi>=30 && bmi<=39.99)
	{
                Description ="Obese - get off the couch! Healthy BMI is 					between 18.5 and 24.99";
				document.getElementById("doctor").style.display = "block";
	}
            else if (bmi>=40)
	{
        Description ="Morbidly Obese - take action! Healthy BMI is between 			18.5 and 24.99";
		document.getElementById("doctor").style.display = "block";
	}
      else Description ="Please check your input values, BMI cannot be calculated.";
         

    $("#res-bmi").html("Your BMI: " + bmi)
    $("#res-health").html(Description )  
    $("#result-content").css("display", "block")
})

jQuery("body").on("blur", ".number-input", function(){
	var input_value = $(this).val()
	if(isNaN(input_value)){
		$(this).siblings(".msg").html("please input an number")
		$(this).siblings(".msg").css("display", "inline-block")
	}else{
		$(this).siblings(".msg").css("display", "none")
	}
})

</script>';
