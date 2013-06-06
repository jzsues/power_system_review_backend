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
 * Locale: KA (Georgian; ქართული)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "ამ ველის შევსება აუცილებელია.",
		remote: "გთხოვთ მიუთითოთ სწორი მნიშვნელობა.",
		email: "გთხოვთ მიუთითოთ ელ-ფოსტის კორექტული მისამართი.",
		url: "გთხოვთ მიუთითოთ კორექტული URL.",
		date: "გთხოვთ მიუთითოთ კორექტული თარიღი.",
		dateISO: "გთხოვთ მიუთითოთ კორექტული თარიღი ISO ფორმატში.",
		number: "გთხოვთ მიუთითოთ ციფრი.",
		digits: "გთხოვთ მიუთითოთ მხოლოდ ციფრები.",
		creditcard: "გთხოვთ მიუთითოთ საკრედიტო ბარათის კორექტული ნომერი.",
		equalTo: "გთხოვთ მიუთითოთ ასეთივე მნიშვნელობა კიდევ ერთხელ.",
		accept: "გთხოვთ აირჩიოთ ფაილი კორექტული გაფართოებით.",
		maxlength: $.validator.format("დასაშვებია არაუმეტეს {0} სიმბოლო."),
		minlength: $.validator.format("აუცილებელია შეიყვანოთ მინიმუმ {0} სიმბოლო."),
		rangelength: $.validator.format("ტექსტში სიმბოლოების რაოდენობა უნდა იყოს {0}-დან {1}-მდე."),
		range: $.validator.format("გთხოვთ შეიყვანოთ ციფრი {0}-დან {1}-მდე."),
		max: $.validator.format("გთხოვთ შეიყვანოთ ციფრი რომელიც ნაკლებია ან უდრის {0}-ს."),
		min: $.validator.format("გთხოვთ შეიყვანოთ ციფრი რომელიც მეტია ან უდრის {0}-ს.")
	});
}(jQuery));