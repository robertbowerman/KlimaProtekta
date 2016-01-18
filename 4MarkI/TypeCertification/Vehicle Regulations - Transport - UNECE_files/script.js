function getAjaxObject()
{
	var xmlhttp = null;
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	return xmlhttp;
}

function submitMeeting(uid, pid, root_id, lang)
{
	document.getElementById("uqid").value = root_id;
	document.getElementById("langid").value = lang;

	var url = "typo3conf/ext/mepversion5/pi1/GetRealURL.php?uid="+uid+"&lang="+lang; 
	if(uid == 0)
	{
		document.getElementById("uqid").value = pid;
		document.getElementById("docspage").value = "no";
		url = "typo3conf/ext/mepversion5/pi1/GetRealURL.php?pid="+root_id+"&lang="+lang; 
	}
	
	var xmlhttp = getAjaxObject();
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			if(xmlhttp.responseText != "")
			{
				var form = document.getElementById("uqid").parentNode;
				form.action = xmlhttp.responseText;
				form.submit();
			}
		}
	}
	xmlhttp.open("GET", url, true);
	xmlhttp.send();
}