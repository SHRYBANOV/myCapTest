sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"vacantion2/test/integration/pages/EmployeeList",
	"vacantion2/test/integration/pages/EmployeeObjectPage"
], function (JourneyRunner, EmployeeList, EmployeeObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('vacantion2') + '/test/flpSandbox.html#vacantion2-tile',
        pages: {
			onTheEmployeeList: EmployeeList,
			onTheEmployeeObjectPage: EmployeeObjectPage
        },
        async: true
    });

    return runner;
});

