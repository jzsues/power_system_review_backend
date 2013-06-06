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
 * Locale: EU (Basque; euskara, euskera)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Eremu hau beharrezkoa da.",
		remote: "Mesedez, bete eremu hau.",
		email: "Mesedez, idatzi baliozko posta helbide bat.",
		url: "Mesedez, idatzi baliozko URL bat.",
		date: "Mesedez, idatzi baliozko data bat.",
		dateISO: "Mesedez, idatzi baliozko (ISO) data bat.",
		number: "Mesedez, idatzi baliozko zenbaki oso bat.",
		digits: "Mesedez, idatzi digituak soilik.",
		creditcard: "Mesedez, idatzi baliozko txartel zenbaki bat.",
		equalTo: "Mesedez, idatzi berdina berriro ere.",
		accept: "Mesedez, idatzi onartutako luzapena duen balio bat.",
		maxlength: $.validator.format("Mesedez, ez idatzi {0} karaktere baino gehiago."),
		minlength: $.validator.format("Mesedez, ez idatzi {0} karaktere baino gutxiago."),
		rangelength: $.validator.format("Mesedez, idatzi {0} eta {1} karaktere arteko balio bat."),
		range: $.validator.format("Mesedez, idatzi {0} eta {1} arteko balio bat."),
		max: $.validator.format("Mesedez, idatzi {0} edo txikiagoa den balio bat."),
		min: $.validator.format("Mesedez, idatzi {0} edo handiagoa den balio bat.")
	});
}(jQuery));