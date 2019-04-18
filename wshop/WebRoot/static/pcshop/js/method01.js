//****************针对第一种方式的具体js实现部分******************//
//****************所使用的数据是city.js******************//

/*根据id获取对象*/
function $(str) {
    return document.getElementById(str);
}

var addrShow = $('city');
var prov = $('prov');
var citys = $('citys');
var country = $('country');


/*用于保存当前所选的省市区*/
var current = {
    prov: '',
    citys: '',
    country: ''
};

/*自动加载省份列表*/
(function showProv() {
    var len = provice.length;
    for (var i = 0; i < len; i++) {
        var provOpt = document.createElement('option');
        provOpt.innerText = provice[i]['name'];
        provOpt.value = i;
        prov.appendChild(provOpt);
    }

    var cityArray= new Array();
    cityArray=addrShow.value.split(" ");
    console.log("provance:"+cityArray[0]);
    console.log("city:"+cityArray[1]);
    console.log("area:"+cityArray[2]);
    //prov.value = cityArray[0];
    //citys.value = cityArray[1];
    //country.value = cityArray[2];
})();

/*根据所选的省份来显示城市列表*/
function showCity(obj) {
    var val = obj.options[obj.selectedIndex].value;
    if (val != current.prov) {
        current.prov = val;
        addrShow.value = '';
    }

    //console.log(val);
    if (val != null) {
        citys.length = 1;
        country.length = 1; //清空之前的内容只留第一个默认选项
        var cityLen = provice[val]["citys"].length;
        for (var j = 0; j < cityLen; j++) {
            var cityOpt = document.createElement('option');
            cityOpt.innerText = provice[val]["citys"][j].name;
            cityOpt.value = j;
            citys.appendChild(cityOpt);
        }
    }
}

/*根据所选的城市来显示县区列表*/
function showCountry(obj) {
    var val = obj.options[obj.selectedIndex].value;
    current.citys = val;
    if (val != null) {
        country.length = 1; //清空之前的内容只留第一个默认选项
        var countryLen = provice[current.prov]["citys"][val].districtAndCounty.length;
        if(countryLen == 0){
            addrShow.value = provice[current.prov].name + ' ' + provice[current.prov]["citys"][current.citys].name;
            return;
        }
        for (var n = 0; n < countryLen; n++) {
            var countryOpt = document.createElement('option');
            countryOpt.innerText = provice[current.prov]["citys"][val].districtAndCounty[n];
            countryOpt.value = n;
            country.appendChild(countryOpt);
        }
    }
}

/*选择县区之后的处理函数*/
function selecCountry(obj) {
    current.country = obj.options[obj.selectedIndex].value;
    addrShow.value = provice[current.prov].name + ' ' + provice[current.prov]["citys"][current.citys].name + ' ' + provice[current.prov]["citys"][current.citys].districtAndCounty[current.country];
    console.log("addrShow.value:"+addrShow.value);
}