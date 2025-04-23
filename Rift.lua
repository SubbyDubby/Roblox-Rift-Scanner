-- Fully Automatic AWP.GG Rift Scanner
-- Configuration (EDIT THESE)
local WEBHOOK_URL = "https://discord.com/api/webhooks/1363251024210432164/B26f2Tvrl_QuigIZ5AJswcd1hYKPGxIHlYzUUu-cicdhF6kj2i5hrQi16-YK2-R7rk0Y" -- Replace with your actual webhook
-- Add the 25x webhook URL (you can use the same URL if you want)
local WEBHOOK_URL_25X = "https://discord.com/api/webhooks/1363451259016712192/OIMNA2MKvtfFW2IZOj5zDyoqhDYFlV-uU1GARyJwWSPSVHQzDAvSThojSOf1n9f5E6de" -- Replace with your special webhook for 25x rifts
local PLACE_ID = 85896571713843
local PLACE_ID = 85896571713843
local jobIds = {
        "9421af1d-0d48-4ff6-9c36-7a6b136f4e4d",
        "da80d6f5-d4c3-471e-aa8e-15aa24cb8904",
        "7ca8f62d-c2ee-4f5f-b614-8ce73b03ae99",
        "70822e05-c725-45ec-84c5-d12d6998fee0",
        "8bdf1b5d-46dd-48b1-80d2-08a3c1fcd47a",
        "625d71fb-04f5-42e1-ab9b-96c358c6b97a",
        "9a27556b-845a-4f22-9e5f-85d1952a00be",
        "79391d0c-3fa9-430a-a68f-9dad010235cd",
        "8ab47979-c8dd-4977-abf4-dfbb1f9a04bf",
        "5e1da7bc-a0f9-44c7-bcb0-3b20a8345c27",
        "92885218-128c-4e5b-ac13-e6214e160b67",
        "412a3edf-7af3-4cb4-b6da-f96213edfeba",
        "cc7fb92c-bcaa-43e5-b4c6-f901f1b41a58",
        "6e323786-9aba-4591-a247-73d94d03caed",
        "40b14a09-160e-44d8-bc3e-84ad1d86c372",
        "050d22ed-f811-48f6-ad00-96eb97f7411f",
        "61194cfb-044a-4866-ae01-d819ec1109b9",
        "5842ad48-c8dd-4d68-932f-d06db76743dd",
        "74511509-6c87-42ec-bcfa-156afd4fd9ee",
        "5616898d-db4f-4935-bb3a-b4888a405735",
        "25065d00-1fae-471c-8108-c59cea26a073",
        "9666f09b-b580-4da7-8dbe-7da8e17d261b",
        "d7293d74-f1a8-480d-ba5e-df8b5ec0b9a0",
        "985f39b8-9e06-400f-9fe0-417a7d00989b",
        "188e4897-8e27-4e38-b86e-095b3d7c7e1a",
        "85d7e165-8f07-4d80-aead-1086c7d33753",
        "a3300b6c-4f3a-46a9-9256-0370569562c6",
        "8fdd1e02-2c8a-4860-933d-554527e3c286",
        "de4076a1-3bf6-427a-b049-879b8622d7f8",
        "539cb586-0d75-48b8-8546-aa6d114fad6c",
        "d0691110-4a69-4a80-83c8-a9ea2a04e9b3",
        "ff2bc6ee-8e12-4782-bf3f-bdf2ee82be4b",
        "e17734be-8ba3-44bd-b785-0f20882bed56",
        "749b8ef9-d2e3-4fcd-9a86-80c5ddc312d9",
        "3bd1098a-7593-44be-8bd0-0067fe503a53",
        "3b76eb1d-f600-4985-8cd2-9c1a5792130c",
        "4b0fc458-2c06-4bff-844c-f51c5a47ee42",
        "c007b8bb-e6aa-4d49-84b0-22f695b39b8d",
        "2f0fb4c0-dab6-41af-a24f-fabba29be094",
        "20b32c0c-6b21-4387-985e-393331beeaa4",
        "2ff93a86-ed56-4660-b4a6-76b0aeb8f488",
        "c21c4f21-98fe-4c71-aa7f-c3baa8780dff",
        "4c38caa6-d251-43ae-ab99-a040614aa7fd",
        "d7f26735-7a84-4aa5-a81a-b7d82ecf0854",
        "370e0356-a858-497e-adef-fbac2b7116c6",
        "67edb116-6789-4895-b9c3-e6164130c000",
        "ba9f0b51-45c0-4c7f-8644-d8e8e959fd0a",
        "80afd4d2-5d8a-4d10-b9de-b9bf8d7b58a7",
        "476207a8-b068-4455-848f-9b96d24cbb66",
        "619d609d-5af4-46c7-8418-d5df742761b1",
        "c6de97ac-f9e1-49ac-8352-8a3ad8e7e6b2",
        "5c1b9159-e794-4008-a630-e8af94e7656b",
        "a1c9dc98-e45e-4500-8148-6d49c049f1e7",
        "5fdfda72-60e2-468c-af2a-1403a63774d6",
        "d4a8c87a-1cbc-4f64-99c0-11b018bcc312",
        "108f4f39-13be-485b-a97a-8ac885b96889",
        "53731c25-5d6f-405a-8f2e-663843edb561",
        "16253174-8861-4774-9d38-49ec417b97ff",
        "5aa0ee4a-da6c-4d91-8053-9b40f2fb327e",
        "a3fd1c42-6e2d-4b6e-b84c-feb96bfbb189",
        "17a3bf3d-8569-4d5e-bf33-80e18b25e00f",
        "cb3aeb8b-b510-428f-b7ff-5521ad7f7c72",
        "d1ec2dc6-4493-4671-bb7a-9dd146202e1b",
        "a3976b18-d7d1-499b-b6de-92ddd7fe7a7d",
        "743429a3-b740-4b08-9237-629d622ca32b",
        "9d709436-a842-494f-94cc-2716b946074d",
        "f99ac257-b337-4242-991f-07ea096c8c1d",
        "2a2dd5c2-0cee-49fa-be62-69de5d6c98eb",
        "e5918474-bbdf-4c55-9285-6d6ff412903a",
        "4c2948ba-f18c-4162-bbe2-d450d473fd25",
        "4cc182e7-3a03-4029-bac2-6514c10eb600",
        "5d31ec3c-d410-4b64-9eb5-e9662c65f361",
        "611bb01a-0306-44a8-b8d0-8569b1ef45d1",
        "39f58d4a-9941-4130-8229-c9419d53c4d9",
        "79beebc5-d623-4554-beb0-a23330197b4e",
        "3d13a909-dd7a-4a91-9337-00020a507a12",
        "f72eaa98-d52e-4dd0-af4e-aeaf4e13f277",
        "fe89d943-6a1e-43a7-a409-c697eccaeb5a",
        "61308baa-1c38-45b8-bc2c-460b80024e3c",
        "be702431-0076-4a72-baf8-f91d728af8ab",
        "f85004ec-c5dd-45b5-b4e3-c50b140c66e6",
        "b3d49230-3f00-4f12-8a75-bb99cd5fb31d",
        "b8c6a533-f508-4592-a2e2-3e1a4a8b0f03",
        "4812d136-0ce9-4e75-9e2a-65122944b43d",
        "a6df0e4b-cfc2-4e0d-909d-3dd961817867",
        "9b43fc55-2e22-40e6-8218-4a072f128502",
        "0786356d-05ff-4ad3-84f6-990bbc8cbaba",
        "c9c2c0f5-88ac-4b81-8334-89e3388212d0",
        "ba2750a1-184d-4540-9280-ed0b91f16b49",
        "282f4acc-0d28-4a68-bc65-a0b44c5bb55d",
        "9f79064c-04db-4fae-9105-1bdd20166ade",
        "54df6bd9-5e4d-4c14-9c0d-4d2863ec81b8",
        "3223e0b3-a019-4472-bdbb-18633f8d0d14",
        "afa6f08e-0e6f-4737-9e92-61f535e19817",
        "0d4cb12a-e6cc-4d86-9d7f-e65be5119830",
        "9bf53aab-cf03-476e-ab22-133118401245",
        "35054fb9-2d54-4092-915a-3f0828a6c9b2",
        "35ba550b-564a-4ceb-a5a6-1d61cc3029f4",
        "481540cc-c8ee-4a6b-ace3-bb1bcf7ae006",
        "450b39c6-9204-4d58-8880-44f99b280d1c",
        "12ad7a5c-c27b-4520-a124-b80ffeeb9af9",
        "15791b30-f56f-4bb0-86ab-f2e072ec31da",
        "6f4ce834-1444-4836-a0b4-158d1f978b6c",
        "5f4e3a77-811c-4711-94db-e57b47cdfc18",
        "6899a45c-f14e-4728-a4e9-ffbe8a17c00a",
        "610a0c47-fdf2-48f1-b496-b679a3453f51",
        "55d67106-53c7-4848-bd47-131642cab4b4",
        "7bdc614d-4972-44cb-9fb9-54f6cf029db8",
        "5d1607ea-c6ec-4a67-a437-8b8a0713d452",
        "4593b78d-11ea-4a15-b530-68a6bdb4c51b",
        "ffb6ac23-ac9d-43db-9548-9e278425ee8f",
        "50a257f8-4bec-42e9-8021-512fb5223091",
        "685aee9e-eacb-491f-8faa-f8137a6dca6a",
        "1ac634e9-5e8b-4edb-a4a9-6993c80c3292",
        "29d0f82e-ee25-42a6-83f0-66a7e4fef960",
        "f536de2b-d7a7-4733-8ad6-0064b03e74ec",
        "6d8f7159-892b-40c1-b124-e25715135a5b",
        "adc3ebb7-b211-4e85-8b0b-2cacc7c67451",
        "d86f206c-6e07-406d-bbd5-75674aa123db",
        "95e1e76a-47d2-4f53-b754-2bef9936ef12",
        "3372bff4-b1d6-497a-9a00-9aa57ce94bf3",
        "694d71a2-ec87-4215-aafe-42b1e90f72cf",
        "0636dfa0-1df5-4157-87cd-d363ef1d5189",
        "e0670645-7411-4c35-8e4d-40f65b09af6c",
        "6b83a39b-cb9e-4e3e-8f8f-18b6bcd88733",
        "020cb1a5-cff5-4f16-955c-28eea807c623",
        "a77b2fdf-2f73-4de3-af4d-41b52c9af6cc",
        "35168686-c228-4def-9a40-07bda7e63bb7",
        "cefafde0-25b5-441d-a956-2090d67f574e",
        "0565d026-c463-4b44-9a83-80b25cae262b",
        "044a769d-e3b8-4034-83e9-0a9bd2433704",
        "f26f93a3-5300-498c-a486-082cb243bc76",
        "3b00824f-4ea2-4d6e-8a0b-4d69078666ae",
        "ff8de866-4752-4bcf-bf9c-9dfb7d3c0c40",
        "13f738d6-b699-49a0-9346-aeb903d61d78",
        "ca34d6f3-c8d6-417b-98c2-eb4faf9a4aa8",
        "a5f4f6e5-9211-4d3a-ba1a-cbb00cfcc49b",
        "b6e49c8c-53cc-43de-86df-291d5a2aee34",
        "6610d521-fb31-4363-8726-b33c6442803e",
        "3b4e960a-e554-42ad-a332-66716e1ace47",
        "cfd4e34a-d159-4cd3-a85d-cae12be52c5c",
        "8422efd6-dfd5-430b-b190-69be7abd2d98",
        "6cc9cc63-1a38-4b6f-9cf8-c1177fe51ab9",
        "8fefc3c6-897f-4957-8717-33fdaf8a6668",
        "992248d2-7ce1-486a-b78d-723493f29e50",
        "e3629c90-89af-4574-9941-5d3c22b7b536",
        "a497576d-b933-45f8-8ee6-49862fb59413",
        "639968b4-d62b-4e86-9894-5f2b912639ea",
        "e7ffd64e-ca68-47d1-8aac-b3667151a49e",
        "69c20e43-9583-4c54-8195-a08c90307255",
        "a4993b76-5fe6-4fc7-972d-a51e03ec8459",
        "4f33f617-d205-4a05-a757-fc478d61e4c9",
        "9ec76e7a-18f5-41a8-9e1e-a31bc0ff9516",
        "ab3c5139-c44b-4576-9bd8-4e84fc45fc75",
        "10e4f7aa-43d5-4da2-bb6f-e2a2bfb8a904",
        "89e9bc04-798b-4a48-a161-5266410df71e",
        "1dbf8464-8290-48bc-b2d2-7528e628923f",
        "664f6add-86e8-4d32-835a-5a4e48eb0f59",
        "63930f6f-88da-4ace-b2a2-c031f65db636",
        "19e3bcab-43f2-4b3a-8bfa-7819617a14d2",
        "4ee749fb-e926-43b3-8fbd-57b423df3658",
        "a025dd4b-6bd0-4a62-8559-d0041c830d6a",
        "66bed870-d394-4226-a368-8e6e17dcf29a",
        "a24d39db-f0fe-43f9-9c58-2e6b1dcaceda",
        "11163f80-51de-488a-8938-1785eaf49db7",
        "7a831dcc-1a07-4912-9cf2-a27f1da7e9f5",
        "10457681-48c3-4c96-834a-ee73158afb7e",
        "6a0b1b52-9b99-47fb-adb3-ebb2e336fae7",
        "6b2a5ec3-4386-4106-9ff0-dae159e745bd",
        "cf98db9b-f8e5-4ef6-8568-a68b2841b324",
        "3ddba549-6684-4182-81dc-51463a8a2bd9",
        "48940784-be7d-42df-bed1-3eb8a63f6773",
        "36713a3e-05bf-40a1-b84f-0acd31499c30",
        "6e818e78-48d8-4ab4-8f2a-57748c96ed01",
        "5a90ce2c-5c35-4391-b456-1de5d47227c3",
        "6b9119de-a48a-4039-9ad3-6e13e00a55fa",
        "9bb2656f-77c0-42f7-8b42-0d233cf5c00c",
        "3a44f248-cb89-4927-83b4-17fd41359390",
        "6be1f5d8-545b-457c-aca4-99514c389c33",
        "9502e7c9-5b37-474a-8447-231e2b9607d1",
        "fbe52db4-8b6f-4cb9-a379-fddd6d9d5ec6",
        "683c028c-4c4b-4e8c-953a-eeb359adc904",
        "f5443ab9-794f-416d-84f9-56cc9251f23c",
        "6fe6c4f4-17e0-4c2a-bacc-e2c36530c361",
        "f6d6e06b-fcd7-4d0b-841f-ebee92f05a0a",
        "5915ca12-5a46-471e-8d39-31ed83854c87",
        "f7619667-6bbd-41ed-98a6-c4a9ec7fcd9c",
        "a5ef6ca5-436b-4c4b-92e8-95c89286aef6",
        "878e55d9-5161-48ad-8c70-b88b1dca1943",
        "8ca1ebd1-115a-42a0-abbb-854a8c0b0744",
        "dfc7c29c-e870-4005-8cdc-68f02b3c3742",
        "04b6f851-f3b8-4e43-8de1-c32cb2624d96",
        "611a5c40-98d6-4ab4-a3f8-fa3e050541b2",
        "2e01ea24-8b9e-4720-af0f-a086d32be88f",
        "f774f34b-0a45-4279-925b-2f61547a88e0",
        "490e424c-a61b-4987-a0a0-f6d4cc90bea7",
        "b940fd35-6272-4295-b7b2-892c6fa8dddf",
        "72e7272c-20ba-4a9a-a811-5f8534fd3576",
        "17ebbc47-a716-4987-aa94-0a9d6788c21b",
        "646377dd-2cb1-43b7-8630-051ee5d6dc23",
        "4fe63715-fcb0-419c-8cf6-21599620f5c4",
        "fbc3e238-dee1-4642-be1d-448e0e3b1ccc",
        "d0c8e074-3be3-4cd9-9f35-46ff1e838060",
        "cfe8016c-622b-4845-a7e8-08929c4bde80",
        "23ed9014-452f-4d05-b653-968d68233890",
        "5f664230-bdcd-4466-96c5-fe5647b37200",
        "c10474c6-18b1-4e43-9506-d696ca4e0f6c",
        "ba82c99a-79a1-46a1-9348-6ef3b7391364",
        "a215f293-dc22-4c2f-9e03-673df22f0dbf",
        "d0b88cf8-6744-41c2-944f-88197b983e81",
        "421ac549-4709-48d3-968c-3c73955cbcd8",
        "8aa9a63f-7f5a-47b9-ba4b-332c4cd95691",
        "73f46333-7969-48c2-a3f4-f6ed946d931a",
        "c2a31d9d-c190-42a7-bc07-cd6b39e4f22f",
        "112afe8e-15cc-4dd5-86b5-af23936a79a8",
        "480dc1f8-ecdc-4ad2-9644-c47540e8acb8",
        "bb259a81-7424-4fd5-a763-6ff13ebfbf8a",
        "a088b91a-46b7-4ea5-b140-177aa7e8bea8",
        "502a2f4c-1a6d-4354-9ea2-a977b864e2f8",
        "d091dda9-73e4-4e50-aad1-92495cca32d4",
        "b8d20695-cfd7-4762-bac4-685ac7daf65d",
        "1dc0bcdd-5089-453e-9db3-1950cdb7647a",
        "107749c9-62b6-4aa9-b5e8-92c726cccb75",
        "73b240f5-79b7-48c8-9766-4f736b4da0af",
        "ca847a42-428e-43f2-97b3-97c3ba69d877",
        "26f344e6-f996-4224-bd3f-f5045802d14c",
        "c75803a6-df78-4aaf-8c17-9d205c6fee87",
        "f2c59585-c03e-45eb-81d0-97bad170fa65",
        "9f3c1319-767d-4911-97ae-a0e33ed08493",
        "2d4e61c3-e45f-4ec3-a8fa-786cc8f63349",
        "75b4b9b2-1bc3-4ed5-ab54-c94277facb17",
        "db7133de-2713-4c38-bf1f-49e010beed7b",
        "b352775d-ab19-4898-bb25-f3afe4bef706",
        "fdc67835-f9a9-4a0c-94ab-30b69f0f3045",
        "aab8d251-f92b-4ad4-8517-c0e2cc586cbe",
        "3abd65b8-b4cf-4d7d-9207-a872f421c3e0",
        "1e80cf4e-ba94-4e2f-be9e-014d978aa1b5",
        "60e81b75-c89e-42bc-971c-992e5d1655ab",
        "1af977d5-34e8-45b6-81ed-231a71abe966",
        "f9304d1c-eb20-4f1f-9ce9-25c5631671e5",
        "cdfd232b-81c6-4658-a188-cd45d169b229",
        "3c30700a-c5ad-4f23-b031-5d1a5901af3b",
        "27d8d03a-6b6f-4cff-b882-e1261ad69346",
        "f2d5e621-f8a6-4ce6-8996-142f18af1f3e",
        "e1f81aec-dd95-4fd1-9a5b-b6b9b8859842",
        "37bca30b-6b2a-458b-8631-122a450c5cc9",
        "5cd76dbb-d4fa-4925-babc-64cc055a1f9c",
        "64e25082-bbb6-42ac-84d4-7df1aba7544b",
        "509e70d2-6e49-493f-9563-68b6ff105a17",
        "cbbb05a3-b304-41d0-ac31-2b4fad4e21db",
        "7b9d0693-fce9-49e4-94c8-79260b5b55e8",
        "8535f77e-d65d-4d4c-8d78-c63e45320460",
        "c30a969b-f4b0-486b-b941-9a9a0300bb5e",
        "d31927f6-28ae-4408-bfcd-ae110446f3be",
        "66f002ed-ae7c-4ac0-b5e8-5054d3496b3e",
        "5347e1e5-4b89-4006-9349-0034670602cf",
        "91c9d30c-73b0-4e52-bf2b-ef8a4ddddad9",
        "1cb1f4e8-46ec-46e4-8756-dd37f3664ede",
        "76f1b0c0-cd5e-403f-99e8-feea5da13af2",
        "fc9144f7-3df0-4592-b3cf-d1aaca8c4e86",
        "153aeed9-91b5-49be-a04e-ea682d45fc05",
        "ab04e038-7b01-471f-9ce0-c6a60ad83aa6",
        "24afbe62-5978-4f67-962a-168f92604ffa",
        "0ad3a282-f318-42d7-b29e-2153de71a1c3",
        "dccd7021-ced1-4525-9bc3-73780adac3b8",
        "a6d7b478-96e0-4125-b8f2-39bcb38d3d59",
        "a42e81b2-c2f6-412b-8059-c0940dd13142",
        "36f33cf0-38b5-4da0-a68a-523e2a8dace2",
        "34705a04-dfb9-43fd-a4fb-f88f6fcf3616",
        "7fde79fb-7654-4d94-8422-bb0f253571e0",
        "8998fc13-dbfd-41a9-90f9-b9025fdd4cf0",
        "0f3fc5c7-4f63-49dd-8766-46fb42f06924",
        "96d8d001-2714-49c4-a34c-4e820f661b8d",
        "f1387e4e-6a9a-48e7-9e00-d0baa7677aa9",
        "0d592626-2cc8-4b49-b9a8-6b3a2de4c790",
        "ff8dbf96-f688-497e-ae7a-aae39c6e8309",
        "18c623f0-3e67-4b3d-b1d5-05cf23d77585",
        "1ccdf4af-4d54-4376-887c-3f2120170677",
        "8872ce68-b60d-4142-8b95-9cf80e15f0a9",
        "fd8a5561-5572-45ce-9038-c17f1c4f8cc8",
        "cdb89322-dc8b-497b-92fd-97c20db8c6af",
        "ce866931-5751-475b-ac83-d718086cefdd",
        "1d5bda86-7748-48aa-868d-1ba20a2c5076",
        "b6b46370-29ae-47c9-91ee-deeaad9c507b",
        "371742f2-a257-416b-8acc-53a88b89d75d",
        "11716046-3079-4488-8b01-bf1c64251f5c",
        "b5fcaa8e-f2fd-49c4-a762-162c4de45559",
        "447a9539-e7d7-424f-a3db-e2f92ccaca87",
        "76b3872f-b51f-409f-8e3b-3796fedd3cc1",
        "dc2783a4-6904-4f6d-a949-d8d51d21c932"
}

-- Initialize or restore global state
_G.RiftScanner = _G.RiftScanner or {
    CurrentIndex = 1,
    SentNotifications = {}
}

-- Services
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Get the appropriate request function
local request = http_request or request or (syn and syn.request) or (fluxus and fluxus.request) or getgenv().request
if not request then
    print("ERROR: No HTTP request function found!")
    return
end

-- Send webhook function (unchanged)
local function sendWebhook(title, fields)
    print("Sending webhook: " .. title)
    
    local embed = {
        title = title,
        fields = fields,
        color = 10597128,
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }

    local payload = HttpService:JSONEncode({ embeds = { embed } })

    local success, response = pcall(function()
        return request({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = payload
        })
    end)
    
    if success then
        print("Webhook sent successfully!")
    else
        print("Failed to send webhook: " .. tostring(response))
    end
end

-- Special webhook function for 25x multipliers
local function send25xWebhook(title, fields)
    print("Sending 25x webhook: " .. title)
    
    local embed = {
        title = title,
        fields = fields,
        color = 16711680, -- Bright red color for emphasis
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }

    local payload = HttpService:JSONEncode({ embeds = { embed } })

    local success, response = pcall(function()
        return request({
            Url = WEBHOOK_URL_25X,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = payload
        })
    end)
    
    if success then
        print("25x webhook sent successfully!")
    else
        print("Failed to send 25x webhook: " .. tostring(response))
    end
end

-- Optional: Uncomment to test the 25x webhook
--send25xWebhook("TEST 25x WEBHOOK", {
--    { name = "Test", value = "This is a test", inline = true },
--    { name = "Join Server", value = "[Click to Join](https://slayervalue.com/roblox/join_game.php?placeId=" .. PLACE_ID .. "&jobId=test)", inline = false }
--})
--print("Test webhook sent")

-- Scan for rifts
local function scanRifts()
    print("Scanning for rifts...")
    local foundRift = false
    local currentSeen = {}

    -- Look for the rifts folder
    local riftFolder = Workspace:FindFirstChild("Rendered") and Workspace.Rendered:FindFirstChild("Rifts")
    if not riftFolder then 
        print("Rifts folder not found")
    else
        print("Rifts folder found, checking for rifts...")
        
        -- Loop through all rifts
        for _, rift in pairs(riftFolder:GetChildren()) do
            if not rift:IsA("Model") then continue end

            local name = rift.Name:lower()
            local gui = rift:FindFirstChild("Display") and rift.Display:FindFirstChild("SurfaceGui")
            if not gui then continue end

            local timerLabel = gui:FindFirstChild("Timer")
            local luckLabel = gui:FindFirstChild("Icon") and gui.Icon:FindFirstChild("Luck")

            local timer = timerLabel and timerLabel.Text or nil
            local multiplier = luckLabel and luckLabel.Text or nil

            if not timer or timer == "" then continue end

            -- Y Position for height
            local y = rift:GetPivot().Position.Y
            local key = name .. "|" .. timer .. "|" .. (multiplier or "n/a") .. "|" .. y
            currentSeen[key] = true
            foundRift = true

            if not _G.RiftScanner.SentNotifications[key] then
                _G.RiftScanner.SentNotifications[key] = true

                -- Debug print the multiplier
                print("Checking multiplier:", multiplier)

                -- More robust pattern matching for 25x
                if multiplier and (string.find(tostring(multiplier):lower(), "25%s*x") or string.find(tostring(multiplier), "25")) then
                    -- 25x multiplier found - use special webhook
                    print("25x multiplier detected! Attempting to send to webhook...")
                    send25xWebhook("🌈 25x MULTIPLIER RIFT FOUND!", {
                        { name = "Egg", value = name, inline = true },
                        { name = "Multiplier", value = multiplier, inline = true },
                        { name = "Time Left", value = timer, inline = true },
                        { name = "Height (Y)", value = tostring(math.floor(y)), inline = true },
                        { name = "Join Server", value = "[Click to Join](https://slayervalue.com/roblox/join_game.php?placeId=" .. PLACE_ID .. "&jobId=" .. game.JobId .. ")", inline = false }
                    })
                elseif multiplier then
                    -- Regular multiplier rift (unchanged)
                    print("Found regular rift: " .. name .. " with " .. multiplier .. " luck")
                    sendWebhook("🌈 Rift Detected!", {
                        { name = "Egg", value = name, inline = true },
                        { name = "Multiplier", value = multiplier, inline = true },
                        { name = "Time Left", value = timer, inline = true },
                        { name = "Height (Y)", value = tostring(math.floor(y)), inline = true },
                        { name = "Server ID", value = game.JobId, inline = false }
                    })
                else
                    -- Chest rift (unchanged)
                    print("Found chest: " .. name)
                    sendWebhook("🎁 Chest Detected!", {
                        { name = "Chest", value = name, inline = true },
                        { name = "Time Left", value = timer, inline = true },
                        { name = "Height (Y)", value = tostring(math.floor(y)), inline = true },
                        { name = "Server ID", value = game.JobId, inline = false }
                    })
                end
            end
        end

        -- Clear despawned entries
        for key in pairs(_G.RiftScanner.SentNotifications) do
            if not currentSeen[key] then
                _G.RiftScanner.SentNotifications[key] = nil
            end
        end
    end

    if not foundRift then
        print("No rifts found in this server")
    end
    
    -- After scanning, wait 15 seconds before hopping
    print("Waiting 15 seconds before moving to next server...")
    wait(15)
    hopToNextServer()
end

-- Auto-continuation script for the next server
local CONTINUATION_SCRIPT = [[
-- Initialize global variables
_G.RiftScanner = _G.RiftScanner or {}
_G.RiftScanner.CurrentIndex = %d
_G.RiftScanner.SentNotifications = {}

-- Wait for game to load
if not game:IsLoaded() then game.Loaded:Wait() end
wait(5) -- Additional wait to ensure everything loads properly

-- Load and execute main script
loadstring(game:HttpGet('https://raw.githubusercontent.com/SubbyDubby/Roblox-Rift-Scanner/main/Rift.lua'))()
]]

-- Hop to next server with advanced auto-continuation and error handling
function hopToNextServer()
    local nextIndex = _G.RiftScanner.CurrentIndex + 1
    
    if nextIndex <= #jobIds then
        local nextJobId = jobIds[nextIndex]
        print("Hopping to server " .. nextIndex .. " with JobID: " .. nextJobId)
        
        -- Update the current index immediately
        _G.RiftScanner.CurrentIndex = nextIndex
        
        -- Create continuation script
        local scriptToQueue = string.format(CONTINUATION_SCRIPT, nextIndex)
        
        -- Queue script to run after teleport
        if getgenv().queue_on_teleport then
            getgenv().queue_on_teleport(scriptToQueue)
            print("Using AWP.GG queue_on_teleport")
        elseif queue_on_teleport then
            queue_on_teleport(scriptToQueue)
            print("Using standard queue_on_teleport")
        elseif syn and syn.queue_on_teleport then
            syn.queue_on_teleport(scriptToQueue)
            print("Using Synapse queue_on_teleport")
        end
        
        -- Wait for queue_on_teleport to register
        wait(1)
        
        -- Set up a failsafe timer to move to the next server
        spawn(function()
            wait(15) -- Wait 15 seconds
            
            -- Check if we're still in the same server
            local currentServer = game.JobId
            if game.JobId == currentServer then
                print("Teleport likely failed or showing error. Moving to next server...")
                loadstring(game:HttpGet('https://raw.githubusercontent.com/SubbyDubby/Roblox-Rift-Scanner/main/Rift.lua'))()
            end
        end)
        
        -- Attempt teleport
        print("Executing teleport...")
        pcall(function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(PLACE_ID, nextJobId, LocalPlayer)
        end)
        
        -- If teleport call returns (didn't throw error), wait a moment and try next method
        wait(3)
        
        -- Try alternative method if we're still here
        pcall(function()
            TeleportService:TeleportToPlaceInstance(PLACE_ID, nextJobId)
        end)
        
        -- Still here? Try one last method
        wait(3)
        if getgenv().teleport then
            pcall(function()
                getgenv().teleport(PLACE_ID, nextJobId)
            end)
        end
        
        -- If we get here, all teleport methods returned without error
        -- but we might still be showing an error dialog
        print("All teleport methods attempted. Waiting for failsafe timer...")
        
    else
        print("Finished scanning all servers in the list. Restarting from the beginning...")
        _G.RiftScanner.CurrentIndex = 0
        hopToNextServer()
    end
end

-- Main execution starts here
print("Rift Scanner started")
print("Current server index: " .. _G.RiftScanner.CurrentIndex)

-- Wait for game to load completely
if not game:IsLoaded() then
    print("Waiting for game to load...")
    game.Loaded:Wait()
end

-- Wait for player character to load
if not LocalPlayer.Character then
    print("Waiting for character to load...")
    LocalPlayer.CharacterAdded:Wait()
end

-- Wait a bit for everything to initialize
print("Waiting 10 seconds before starting scan...")
wait(10)

-- Start scanning
scanRifts()
