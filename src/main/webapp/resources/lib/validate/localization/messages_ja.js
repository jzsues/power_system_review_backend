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
 * Locale: JA (Japanese; 日本語)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "このフィールドは必須です。",
		remote: "このフィールドを修正してください。",
		email: "有効なEメールアドレスを入力してください。",
		url: "有効なURLを入力してください。",
		date: "有効な日付を入力してください。",
		dateISO: "有効な日付（ISO）を入力してください。",
		number: "有効な数字を入力してください。",
		digits: "数字のみを入力してください。",
		creditcard: "有効なクレジットカード番号を入力してください。",
		equalTo: "同じ値をもう一度入力してください。",
		accept: "有効な拡張子を含む値を入力してください。",
		maxlength: $.format("{0} 文字以内で入力してください。"),
		minlength: $.format("{0} 文字以上で入力してください。"),
		rangelength: $.format("{0} 文字から {1} 文字までの値を入力してください。"),
		range: $.format("{0} から {1} までの値を入力してください。"),
		max: $.format("{0} 以下の値を入力してください。"),
		min: $.format("{0} 以上の値を入力してください。")
	});
}(jQuery));