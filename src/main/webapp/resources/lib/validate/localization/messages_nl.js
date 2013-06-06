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
 * Locale: NL (Dutch; Nederlands, Vlaams)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Dit is een verplicht veld.",
		remote: "Controleer dit veld.",
		email: "Vul hier een geldig e-mailadres in.",
		url: "Vul hier een geldige URL in.",
		date: "Vul hier een geldige datum in.",
		dateISO: "Vul hier een geldige datum in (ISO-formaat).",
		number: "Vul hier een geldig getal in.",
		digits: "Vul hier alleen getallen in.",
		creditcard: "Vul hier een geldig creditcardnummer in.",
		equalTo: "Vul hier dezelfde waarde in.",
		accept: "Vul hier een waarde in met een geldige extensie.",
		maxlength: $.validator.format("Vul hier maximaal {0} tekens in."),
		minlength: $.validator.format("Vul hier minimaal {0} tekens in."),
		rangelength: $.validator.format("Vul hier een waarde in van minimaal {0} en maximaal {1} tekens."),
		range: $.validator.format("Vul hier een waarde in van minimaal {0} en maximaal {1}."),
		max: $.validator.format("Vul hier een waarde in kleiner dan of gelijk aan {0}."),
		min: $.validator.format("Vul hier een waarde in groter dan of gelijk aan {0}."),

		// for validations in additional-methods.js
		iban: "Vul hier een geldig IBAN in.",
		dateNL: "Vul hier een geldige datum in.",
		phoneNL: "Vul hier een geldig Nederlands telefoonnummer in.",
		mobileNL: "Vul hier een geldig Nederlands mobiel telefoonnummer in.",
		postalcodeNL: "Vul hier een geldige postcode in.",
		bankaccountNL: "Vul hier een geldig bankrekeningnummer in.",
		giroaccountNL: "Vul hier een geldig gironummer in.",
		bankorgiroaccountNL: "Vul hier een geldig bank- of gironummer in."
	});
}(jQuery));