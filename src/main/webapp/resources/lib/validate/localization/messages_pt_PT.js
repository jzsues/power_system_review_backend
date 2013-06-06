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
 * Region: PT (Portugal)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Campo de preenchimento obrigat&oacute;rio.",
		remote: "Por favor, corrija este campo.",
		email: "Por favor, introduza um endere&ccedil;o eletr&oacute;nico v&aacute;lido.",
		url: "Por favor, introduza um URL v&aacute;lido.",
		date: "Por favor, introduza uma data v&aacute;lida.",
		dateISO: "Por favor, introduza uma data v&aacute;lida (ISO).",
		number: "Por favor, introduza um n&uacute;mero v&aacute;lido.",
		digits: "Por favor, introduza apenas d&iacute;gitos.",
		creditcard: "Por favor, introduza um n&uacute;mero de cart&atilde;o de cr&eacute;dito v&aacute;lido.",
		equalTo: "Por favor, introduza de novo o mesmo valor.",
		accept: "Por favor, introduza um ficheiro com uma extens&atilde;o v&aacute;lida.",
		maxlength: $.validator.format("Por favor, n&atilde;o introduza mais do que {0} caracteres."),
		minlength: $.validator.format("Por favor, introduza pelo menos {0} caracteres."),
		rangelength: $.validator.format("Por favor, introduza entre {0} e {1} caracteres."),
		range: $.validator.format("Por favor, introduza um valor entre {0} e {1}."),
		max: $.validator.format("Por favor, introduza um valor menor ou igual a {0}."),
		min: $.validator.format("Por favor, introduza um valor maior ou igual a {0}.")
	});
}(jQuery));
