sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"vacantion1/test/integration/pages/EmplManagerList",
	"vacantion1/test/integration/pages/EmplManagerObjectPage"
], function (JourneyRunner, EmplManagerList, EmplManagerObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('vacantion1') + '/test/flp.html#app-preview',
        pages: {
			onTheEmplManagerList: EmplManagerList,
			onTheEmplManagerObjectPage: EmplManagerObjectPage
        },
        async: true
    });

    return runner;
});

