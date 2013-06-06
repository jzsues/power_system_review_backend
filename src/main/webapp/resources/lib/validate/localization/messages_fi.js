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
 * Locale: FI (Finnish; suomi, suomen kieli)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "T&auml;m&auml; kentt&auml; on pakollinen.",
		email: "Sy&ouml;t&auml; oikea s&auml;hk&ouml;postiosoite.",
		url: "Sy&ouml;t&auml; oikea URL osoite.",
		date: "Sy&ouml;t&auml; oike p&auml;iv&auml;m&auml;&auml;r&auml;.",
		dateISO: "Sy&ouml;t&auml; oike p&auml;iv&auml;m&auml;&auml;r&auml; (VVVV-MM-DD).",
		number: "Sy&ouml;t&auml; numero.",
		creditcard: "Sy&ouml;t&auml; voimassa oleva luottokorttinumero.",
		digits: "Sy&ouml;t&auml; pelk&auml;st&auml;&auml;n numeroita.",
		equalTo: "Sy&ouml;t&auml; sama arvo uudestaan.",
		maxlength: $.validator.format("Voit sy&ouml;tt&auml;&auml; enint&auml;&auml;n {0} merkki&auml;."),
		minlength: $.validator.format("V&auml;hint&auml;&auml;n {0} merkki&auml;."),
		rangelength: $.validator.format("Sy&ouml;t&auml; v&auml;hint&auml;&auml;n {0} ja enint&auml;&auml;n {1} merkki&auml;."),
		range: $.validator.format("Sy&ouml;t&auml; arvo {0} ja {1} v&auml;lilt&auml;."),
		max: $.validator.format("Sy&ouml;t&auml; arvo joka on pienempi tai yht&auml; suuri kuin {0}."),
		min: $.validator.format("Sy&ouml;t&auml; arvo joka on yht&auml; suuri tai suurempi kuin {0}.")
	});
}(jQuery));
