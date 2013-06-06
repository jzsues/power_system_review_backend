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
 * Locale: PT (Portuguese; português)
 * Region: BR (Brazil)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Este campo &eacute; requerido.",
		remote: "Por favor, corrija este campo.",
		email: "Por favor, forne&ccedil;a um endere&ccedil;o eletr&ocirc;nico v&aacute;lido.",
		url: "Por favor, forne&ccedil;a uma URL v&aacute;lida.",
		date: "Por favor, forne&ccedil;a uma data v&aacute;lida.",
		dateISO: "Por favor, forne&ccedil;a uma data v&aacute;lida (ISO).",
		number: "Por favor, forne&ccedil;a um n&uacute;mero v&aacute;lido.",
		digits: "Por favor, forne&ccedil;a somente d&iacute;gitos.",
		creditcard: "Por favor, forne&ccedil;a um cart&atilde;o de cr&eacute;dito v&aacute;lido.",
		equalTo: "Por favor, forne&ccedil;a o mesmo valor novamente.",
		accept: "Por favor, forne&ccedil;a um valor com uma extens&atilde;o v&aacute;lida.",
		maxlength: $.validator.format("Por favor, forne&ccedil;a n&atilde;o mais que {0} caracteres."),
		minlength: $.validator.format("Por favor, forne&ccedil;a ao menos {0} caracteres."),
		rangelength: $.validator.format("Por favor, forne&ccedil;a um valor entre {0} e {1} caracteres de comprimento."),
		range: $.validator.format("Por favor, forne&ccedil;a um valor entre {0} e {1}."),
		max: $.validator.format("Por favor, forne&ccedil;a um valor menor ou igual a {0}."),
		min: $.validator.format("Por favor, forne&ccedil;a um valor maior ou igual a {0}.")
	});
}(jQuery));