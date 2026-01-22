sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"vacantion1/test/integration/pages/EmployeeList",
	"vacantion1/test/integration/pages/EmployeeObjectPage"
], function (JourneyRunner, EmployeeList, EmployeeObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('vacantion1') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeeList: EmployeeList,
			onTheEmployeeObjectPage: EmployeeObjectPage
        },
        async: true
    });

    return runner;
});

