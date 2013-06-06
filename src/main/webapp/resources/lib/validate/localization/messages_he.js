/*******************************************************************************
 * Copyright (C) 2013 ZVIDIA Co., Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.
 *
 * Contributors:
 *     ZVIDIA Corporation - initial API and implementation
 *******************************************************************************/
/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: HE (Hebrew; עברית)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "השדה הזה הינו שדה חובה",
		remote: "נא לתקן שדה זה",
		email: "נא למלא כתובת דוא\"ל חוקית",
		url: "נא למלא כתובת אינטרנט חוקית",
		date: "נא למלא תאריך חוקי",
		dateISO: "נא למלא תאריך חוקי (ISO)",
		number: "נא למלא מספר",
		digits: "נא למלא רק מספרים",
		creditcard: "נא למלא מספר כרטיס אשראי חוקי",
		equalTo: "נא למלא את אותו ערך שוב",
		accept: "נא למלא ערך עם סיומת חוקית",
		maxlength: $.validator.format(".נא לא למלא יותר מ- {0} תווים"),
		minlength: $.validator.format("נא למלא לפחות {0} תווים"),
		rangelength: $.validator.format("נא למלא ערך בין {0} ל- {1} תווים"),
		range: $.validator.format("נא למלא ערך בין {0} ל- {1}"),
		max: $.validator.format("נא למלא ערך קטן או שווה ל- {0}"),
		min: $.validator.format("נא למלא ערך גדול או שווה ל- {0}")
	});
}(jQuery));