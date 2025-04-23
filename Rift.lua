-- Fully Automatic AWP.GG Rift Scanner
-- Configuration (EDIT THESE)
local WEBHOOK_URL = "https://discord.com/api/webhooks/1363251024210432164/B26f2Tvrl_QuigIZ5AJswcd1hYKPGxIHlYzUUu-cicdhF6kj2i5hrQi16-YK2-R7rk0Y" 
local WEBHOOK_URL_25X = "https://discord.com/api/webhooks/1363451259016712192/OIMNA2MKvtfFW2IZOj5zDyoqhDYFlV-uU1GARyJwWSPSVHQzDAvSThojSOf1n9f5E6de"
local PLACE_ID = 85896571713843

local jobIds = {
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
        "b4d008f4-930c-45b1-a811-e46293605406",
        "b1355301-69db-41dd-8ad1-beca1da1fdda",
        "66245507-e78f-4471-a3d6-bdbb86947dd6",
        "ac098509-7f44-4897-982b-be1c1787773a",
        "9fa73194-0f32-4102-8c86-de2b7cf219e2",
        "4eb8f112-9a59-4fbd-8c21-ba5f6dc7b761",
        "9421af1d-0d48-4ff6-9c36-7a6b136f4e4d",
        "da80d6f5-d4c3-471e-aa8e-15aa24cb8904",
        "7ca8f62d-c2ee-4f5f-b614-8ce73b03ae99",
        "70822e05-c725-45ec-84c5-d12d6998fee0",
        "8bdf1b5d-46dd-48b1-80d2-08a3c1fcd47a",
        "625d71fb-04f5-42e1-ab9b-96c358c6b97a",
        "9a27556b-845a-4f22-9e5f-85d1952a00be",
        "79391d0c-3fa9-430a-a68f-9dad010235cd",
        "8ab47979-c8dd-4977-abf4-dfbb1f9a04bf",
        "cc7fb92c-bcaa-43e5-b4c6-f901f1b41a58",
        "5e1da7bc-a0f9-44c7-bcb0-3b20a8345c27",
        "92885218-128c-4e5b-ac13-e6214e160b67",
        "412a3edf-7af3-4cb4-b6da-f96213edfeba",
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
        "d0691110-4a69-4a80-83c8-a9ea2a04e9b3",
        "539cb586-0d75-48b8-8546-aa6d114fad6c",
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
        "370e0356-a858-497e-adef-fbac2b7116c6",
        "d7f26735-7a84-4aa5-a81a-b7d82ecf0854",
        "67edb116-6789-4895-b9c3-e6164130c000",
        "ba9f0b51-45c0-4c7f-8644-d8e8e959fd0a",
        "a4b1f56d-1144-4919-92c5-0036ed720093",
        "80afd4d2-5d8a-4d10-b9de-b9bf8d7b58a7",
        "476207a8-b068-4455-848f-9b96d24cbb66",
        "ef305c14-4789-4270-9722-f556f900315e",
        "619d609d-5af4-46c7-8418-d5df742761b1",
        "c6de97ac-f9e1-49ac-8352-8a3ad8e7e6b2",
        "5c1b9159-e794-4008-a630-e8af94e7656b",
        "a1c9dc98-e45e-4500-8148-6d49c049f1e7",
        "5fdfda72-60e2-468c-af2a-1403a63774d6",
        "d4a8c87a-1cbc-4f64-99c0-11b018bcc312",
        "108f4f39-13be-485b-a97a-8ac885b96889",
        "b2a4b624-bd8a-462f-9826-72821c0def51",
        "53731c25-5d6f-405a-8f2e-663843edb561",
        "16253174-8861-4774-9d38-49ec417b97ff",
        "5aa0ee4a-da6c-4d91-8053-9b40f2fb327e",
        "a3fd1c42-6e2d-4b6e-b84c-feb96bfbb189",
        "17a3bf3d-8569-4d5e-bf33-80e18b25e00f",
        "cb3aeb8b-b510-428f-b7ff-5521ad7f7c72",
        "d1ec2dc6-4493-4671-bb7a-9dd146202e1b",
        "a3976b18-d7d1-499b-b6de-92ddd7fe7a7d",
        "9d709436-a842-494f-94cc-2716b946074d",
        "743429a3-b740-4b08-9237-629d622ca32b",
        "0d4cb12a-e6cc-4d86-9d7f-e65be5119830",
        "0d470a2a-292c-4563-9898-e36d7de3e7d8",
        "a6df0e4b-cfc2-4e0d-909d-3dd961817867",
        "9b43fc55-2e22-40e6-8218-4a072f128502",
        "0786356d-05ff-4ad3-84f6-990bbc8cbaba",
        "dcc1ae91-9568-4b6e-bd3b-88410bc08728",
        "823a3404-d208-4e36-94c9-1a51eb6ce8f5",
        "c20e6657-c614-4263-bf6d-e2ee9033fd6f",
        "c9c2c0f5-88ac-4b81-8334-89e3388212d0",
        "282f4acc-0d28-4a68-bc65-a0b44c5bb55d",
        "9f79064c-04db-4fae-9105-1bdd20166ade",
        "54df6bd9-5e4d-4c14-9c0d-4d2863ec81b8",
        "c08326d8-ba6c-49cb-a53f-c94bdaa4199c",
        "02339203-cdbd-4205-b751-a9448e5b518a",
        "3223e0b3-a019-4472-bdbb-18633f8d0d14",
        "afa6f08e-0e6f-4737-9e92-61f535e19817",
        "72e7272c-20ba-4a9a-a811-5f8534fd3576",
        "95e1e76a-47d2-4f53-b754-2bef9936ef12",
        "be4af6c5-2f49-4bc7-a54c-22a202e74024",
        "2d364442-da7a-4020-81e4-cc0ee357140b",
        "571659ea-a882-43a4-82ff-781aabe4a842",
        "cefafde0-25b5-441d-a956-2090d67f574e",
        "57a9384a-a571-483f-8e82-915505b8bb59",
        "0636dfa0-1df5-4157-87cd-d363ef1d5189",
        "35054fb9-2d54-4092-915a-3f0828a6c9b2",
        "6c3ad1fa-49d1-4b7c-a80e-bf83d8e336b9",
        "b4214f48-ff5e-4765-b9bf-48035838da03",
        "450b39c6-9204-4d58-8880-44f99b280d1c",
        "9f3c1319-767d-4911-97ae-a0e33ed08493",
        "2d4e61c3-e45f-4ec3-a8fa-786cc8f63349",
        "2fe01d47-8794-4a8e-a32c-eefbe1c29fee",
        "89e9bc04-798b-4a48-a161-5266410df71e",
        "6f4ce834-1444-4836-a0b4-158d1f978b6c",
        "ba2750a1-184d-4540-9280-ed0b91f16b49",
        "5f4e3a77-811c-4711-94db-e57b47cdfc18",
        "4ee749fb-e926-43b3-8fbd-57b423df3658",
        "37bca30b-6b2a-458b-8631-122a450c5cc9",
        "4c4e2781-f687-4622-bd0b-fddd4d5d9400",
        "7bdc614d-4972-44cb-9fb9-54f6cf029db8",
        "84a37a7b-9a91-4b1d-989c-1b67d12d3422",
        "11163f80-51de-488a-8938-1785eaf49db7",
        "5d1607ea-c6ec-4a67-a437-8b8a0713d452",
        "10457681-48c3-4c96-834a-ee73158afb7e",
        "10061405-5030-4670-9e6b-b0ec3de0d8d0",
        "36713a3e-05bf-40a1-b84f-0acd31499c30",
        "4593b78d-11ea-4a15-b530-68a6bdb4c51b",
        "4405dcfb-27b0-4384-bf39-edad5265a7ce",
        "36f33cf0-38b5-4da0-a68a-523e2a8dace2",
        "bdee175e-a508-4c6c-b7f6-a2a6b0b84a2f",
        "543e9e6e-079d-4634-bc28-967044f31eda",
        "ffb6ac23-ac9d-43db-9548-9e278425ee8f",
        "02c307c5-fd3d-4846-ab7e-21d42fa3b17b",
        "b5bc5042-0e66-4f8a-9ecc-20984adbc28f",
        "e51ee230-dceb-4426-96c3-ca3f36883c9d",
        "44042a2d-5c26-4d7a-8e88-ee5e5617771d",
        "f854c52f-cf97-42f4-b941-9b4ca92ab2a7",
        "f5443ab9-794f-416d-84f9-56cc9251f23c",
        "a95f5168-2266-4118-8545-7dccdde3b60a",
        "15791b30-f56f-4bb0-86ab-f2e072ec31da",
        "cfc12457-4e67-40f6-87a8-4da2912f49c5",
        "86333b57-f446-4198-a79b-03f3603c8586",
        "3f6425ea-8ff2-4124-98f5-003bbd9b1809",
        "06b7825f-eea7-4b20-931b-13b73676dacb",
        "6d8f7159-892b-40c1-b124-e25715135a5b",
        "d86f206c-6e07-406d-bbd5-75674aa123db",
        "f774f34b-0a45-4279-925b-2f61547a88e0",
        "b39284ef-d5f9-4437-9e4a-97defeecf8aa",
        "b940fd35-6272-4295-b7b2-892c6fa8dddf",
        "17ebbc47-a716-4987-aa94-0a9d6788c21b",
        "646377dd-2cb1-43b7-8630-051ee5d6dc23",
        "4fe63715-fcb0-419c-8cf6-21599620f5c4",
        "b217f311-e146-4564-a1b4-d331824f9362",
        "d0c8e074-3be3-4cd9-9f35-46ff1e838060",
        "6a847133-57b2-46c4-ac78-c56fc99a5d54",
        "9680ba4f-39bc-4d10-b02b-a998b3be9f96",
        "cfe8016c-622b-4845-a7e8-08929c4bde80",
        "23ed9014-452f-4d05-b653-968d68233890",
        "1d31cb5f-4400-441d-b818-e7203ba5b4c5",
        "e0670645-7411-4c35-8e4d-40f65b09af6c",
        "6b83a39b-cb9e-4e3e-8f8f-18b6bcd88733",
        "020cb1a5-cff5-4f16-955c-28eea807c623",
        "663b6a36-0bce-4544-996e-d56c6e717a98",
        "c70511fb-cbcf-430f-a5f4-238567058255",
        "7c4fc7c6-45ec-4b08-9ea2-da2eb8937abb",
        "044a769d-e3b8-4034-83e9-0a9bd2433704",
        "ff8de866-4752-4bcf-bf9c-9dfb7d3c0c40",
        "13f738d6-b699-49a0-9346-aeb903d61d78",
        "f21c5579-efd5-4da3-ae2b-04ff437c8619",
        "f26f93a3-5300-498c-a486-082cb243bc76",
        "a5f4f6e5-9211-4d3a-ba1a-cbb00cfcc49b",
        "b6e49c8c-53cc-43de-86df-291d5a2aee34",
        "3b4e960a-e554-42ad-a332-66716e1ace47",
        "8422efd6-dfd5-430b-b190-69be7abd2d98",
        "6cc9cc63-1a38-4b6f-9cf8-c1177fe51ab9",
        "c2a31d9d-c190-42a7-bc07-cd6b39e4f22f",
        "8fefc3c6-897f-4957-8717-33fdaf8a6668",
        "992248d2-7ce1-486a-b78d-723493f29e50",
        "bb259a81-7424-4fd5-a763-6ff13ebfbf8a",
        "35ba550b-564a-4ceb-a5a6-1d61cc3029f4",
        "e3629c90-89af-4574-9941-5d3c22b7b536",
        "a497576d-b933-45f8-8ee6-49862fb59413",
        "409ca645-b146-4f8e-9b9a-a1b96a1a8e87",
        "639968b4-d62b-4e86-9894-5f2b912639ea",
        "e7ffd64e-ca68-47d1-8aac-b3667151a49e",
        "074148ce-2fb7-4495-b179-fbac7d9de86f",
        "9ec76e7a-18f5-41a8-9e1e-a31bc0ff9516",
        "12ad7a5c-c27b-4520-a124-b80ffeeb9af9",
        "1dbf8464-8290-48bc-b2d2-7528e628923f",
        "3abd65b8-b4cf-4d7d-9207-a872f421c3e0",
        "664f6add-86e8-4d32-835a-5a4e48eb0f59",
        "63930f6f-88da-4ace-b2a2-c031f65db636",
        "6899a45c-f14e-4728-a4e9-ffbe8a17c00a",
        "74c7cfb6-04d8-4f06-b631-56822732410f",
        "19e3bcab-43f2-4b3a-8bfa-7819617a14d2",
        "76f1b0c0-cd5e-403f-99e8-feea5da13af2",
        "f2d5e621-f8a6-4ce6-8996-142f18af1f3e",
        "50379042-5412-4f55-bf7d-8c304841d98a",
        "66bed870-d394-4226-a368-8e6e17dcf29a",
        "c30a969b-f4b0-486b-b941-9a9a0300bb5e",
        "a24d39db-f0fe-43f9-9c58-2e6b1dcaceda",
        "bba9e94c-e34f-4ef1-9f53-0ae41f6a2c76",
        "5347e1e5-4b89-4006-9349-0034670602cf",
        "ab04e038-7b01-471f-9ce0-c6a60ad83aa6",
        "0db26b89-f05e-4741-b4ba-1e98573255bc",
        "7a831dcc-1a07-4912-9cf2-a27f1da7e9f5",
        "6a0b1b52-9b99-47fb-adb3-ebb2e336fae7",
        "cf98db9b-f8e5-4ef6-8568-a68b2841b324",
        "48940784-be7d-42df-bed1-3eb8a63f6773",
        "6e818e78-48d8-4ab4-8f2a-57748c96ed01",
        "8998fc13-dbfd-41a9-90f9-b9025fdd4cf0",
        "dd9b48c5-c247-4368-94b0-61f65c889172",
        "036cffb3-0879-4cfa-83f0-87d35b03a768",
        "f9ad1c20-228f-4e13-a696-7de905e5e9a6",
        "50a257f8-4bec-42e9-8021-512fb5223091",
        "b01a4c11-e767-44fc-be32-62968bc2f948",
        "91809a34-bf4c-4c3e-ad81-3ffc880d0100",
        "9bb2656f-77c0-42f7-8b42-0d233cf5c00c",
        "fd1154e6-6017-4f67-8826-cfb987a059bc",
        "3a44f248-cb89-4927-83b4-17fd41359390",
        "6be1f5d8-545b-457c-aca4-99514c389c33",
        "b5fcaa8e-f2fd-49c4-a762-162c4de45559",
        "fbe52db4-8b6f-4cb9-a379-fddd6d9d5ec6",
        "683c028c-4c4b-4e8c-953a-eeb359adc904",
        "39b5d417-6bd6-473c-8800-0c6d0de4b88a",
        "6fe6c4f4-17e0-4c2a-bacc-e2c36530c361",
        "95420583-5702-4bee-b6c5-7a9269b0d0c0",
        "5915ca12-5a46-471e-8d39-31ed83854c87",
        "29d0f82e-ee25-42a6-83f0-66a7e4fef960",
        "f7619667-6bbd-41ed-98a6-c4a9ec7fcd9c",
        "e3dd0ada-78e5-4892-90cb-2cd13a7ee7f9",
        "8ca1ebd1-115a-42a0-abbb-854a8c0b0744",
        "522c6a92-c5f2-476c-a4d3-45e29e8fb0c7",
        "89ab0d21-ec92-42bb-b9e1-0693d54c09b8",
        "aa6568c6-0c7b-42d6-855f-452015d56b86",
        "b4f918d5-cb32-4421-a0e6-32d30b03a502",
        "685aee9e-eacb-491f-8faa-f8137a6dca6a",
        "326db3de-c3c9-4f86-8cc2-d52dbe5cd6a9",
        "bd499dec-36d3-4549-81f3-70f464d81c08",
        "7f7ac0ea-85e8-4a2c-b379-7fc848d27758",
        "3372bff4-b1d6-497a-9a00-9aa57ce94bf3",
        "a56f32c9-963c-4055-8997-a5f88a697b26",
        "fbc3e238-dee1-4642-be1d-448e0e3b1ccc",
        "db32c2b7-048e-4ecb-b4a2-f9015b326f4d",
        "cec8f0c7-0c60-4d62-a12b-076c826e2cfd",
        "409f449b-0401-4726-9c48-6da446cc0fda",
        "694d71a2-ec87-4215-aafe-42b1e90f72cf",
        "bc2663bc-b3fe-4380-89e8-35782aff7f0d",
        "bc81e7dd-4235-46a5-b224-7632dee891c5",
        "4f748110-e952-4cf0-8803-8ee933680c38",
        "28209e39-18c4-40fd-8544-cb44293e8d8d",
        "7b164ee3-917a-4097-a3fd-a15c985bc952",
        "c994ea0a-559c-4425-bf47-91c9f85d9b1c",
        "c9a0ff28-e73c-43a1-aad2-34fffc029cfc",
        "e60398a5-2fea-4383-a439-66b2e325f3e8",
        "458fa2a2-278d-44fa-83e1-8ee3c2cfa46a",
        "665d1bfd-1e7d-4d7e-b917-863b79546b5f",
        "a77b2fdf-2f73-4de3-af4d-41b52c9af6cc",
        "5f664230-bdcd-4466-96c5-fe5647b37200",
        "35168686-c228-4def-9a40-07bda7e63bb7",
        "9bf53aab-cf03-476e-ab22-133118401245",
        "c2302a63-d1c8-441d-933a-2062314382f1",
        "c4849e2f-4f86-4f67-a36a-e0257b828d01",
        "5e5e0d5f-6b69-4a8f-b5f9-c90fe9fce714",
        "16531237-08cc-482d-bdc0-83f7b7bc0517",
        "ca34d6f3-c8d6-417b-98c2-eb4faf9a4aa8",
        "a215f293-dc22-4c2f-9e03-673df22f0dbf",
        "d0b88cf8-6744-41c2-944f-88197b983e81",
        "421ac549-4709-48d3-968c-3c73955cbcd8",
        "490e424c-a61b-4987-a0a0-f6d4cc90bea7",
        "6610d521-fb31-4363-8726-b33c6442803e",
        "8aa9a63f-7f5a-47b9-ba4b-332c4cd95691",
        "04f49f08-42d8-43cb-a938-3302187396f2",
        "73f46333-7969-48c2-a3f4-f6ed946d931a",
        "480dc1f8-ecdc-4ad2-9644-c47540e8acb8",
        "dda4dc67-9a4d-4ae0-a721-a5c480aaf74b",
        "a088b91a-46b7-4ea5-b140-177aa7e8bea8",
        "502a2f4c-1a6d-4354-9ea2-a977b864e2f8",
        "481540cc-c8ee-4a6b-ace3-bb1bcf7ae006",
        "1dc0bcdd-5089-453e-9db3-1950cdb7647a",
        "7c1d440b-be71-4a66-b7df-09b95c424b23",
        "107749c9-62b6-4aa9-b5e8-92c726cccb75",
        "73b240f5-79b7-48c8-9766-4f736b4da0af"
}

if not _G.RandomSeeded then
    math.randomseed(tick())
    _G.RandomSeeded = true
    print("Random generator seeded!")
else
    print("Random generator already seeded.")
end

if not _G.RiftScanner then
    _G.RiftScanner = {
        SentNotifications = {},
        AlreadyScannedServer = false
    }
    print("Starting new RiftScanner session")
else
    print("Continuing from previous session")
end

local randomIndex = math.random(1, #jobIds)
_G.RiftScanner.CurrentIndex = randomIndex

print("Picked random job ID index: " .. _G.RiftScanner.CurrentIndex)


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

-- Reduce console spam by limiting log messages
local debugMode = false
local function log(message, forceShow)
    if debugMode or forceShow then
        print(message)
    end
end

-- Send webhook function
local function sendWebhook(title, fields)
    log("Sending webhook: " .. title, true)
    
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
        log("Webhook sent successfully!")
    else
        log("Failed to send webhook: " .. tostring(response), true)
    end
end

-- Special webhook function for 25x multipliers
local function send25xWebhook(title, fields)
    log("Sending 25x webhook: " .. title, true)
    
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
        log("25x webhook sent successfully!")
    else
        log("Failed to send 25x webhook: " .. tostring(response), true)
    end
end

-- Function to auto-dismiss error popups
local function dismissErrorPopups()
    -- Try to find common error popups and dismiss them
    spawn(function()
        while wait(1) do
            -- Look for popup GUIs that might contain OK buttons
            pcall(function()
                for _, gui in pairs(game:GetService("CoreGui"):GetDescendants()) do
                    -- Look for buttons with text like "OK", "Okay", "Close", etc.
                    if (gui:IsA("TextButton") and (gui.Text:match("OK") or gui.Text:match("Okay") or gui.Text:match("Close"))) then
                        log("Found popup button, attempting to click...", true)
                        pcall(function() gui.MouseButton1Click:Fire() end)
                        pcall(function() gui:Destroy() end)
                    end
                end
                
                -- Check player GUI as well
                if LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") then
                    for _, gui in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
                        if (gui:IsA("TextButton") and (gui.Text:match("OK") or gui.Text:match("Okay") or gui.Text:match("Close"))) then
                            log("Found player GUI popup button, attempting to click...", true)
                            pcall(function() gui.MouseButton1Click:Fire() end)
                        end
                    end
                end
            end)
        end
    end)
end

-- Scan for rifts
local function scanRifts()
    -- Skip scanning if we already scanned this server
    if _G.RiftScanner.AlreadyScannedServer then
        log("This server was already scanned, skipping to next server...", true)
        wait(2) -- Brief wait before hopping
        hopToNextServer()
        return
    end
    
    log("Scanning for rifts...", true)
    local foundRift = false
    local currentSeen = {}

    -- Look for the rifts folder
    local riftFolder = Workspace:FindFirstChild("Rendered") and Workspace.Rendered:FindFirstChild("Rifts")
    if not riftFolder then 
        log("Rifts folder not found", true)
    else
        log("Rifts folder found, checking for rifts...", true)
        
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

                -- More robust pattern matching for 25x
                if multiplier and (string.find(tostring(multiplier):lower(), "25%s*x") or string.find(tostring(multiplier), "25")) then
                    -- 25x multiplier found - use special webhook
                    log("25x multiplier detected! Attempting to send to webhook...", true)
                    send25xWebhook("🌈 25x MULTIPLIER RIFT FOUND!", {
                        { name = "Egg", value = name, inline = true },
                        { name = "Multiplier", value = multiplier, inline = true },
                        { name = "Time Left", value = timer, inline = true },
                        { name = "Height (Y)", value = tostring(math.floor(y)), inline = true },
                        { name = "Join Server", value = "[Click to Join](https://slayervalue.com/roblox/join_game.php?placeId=" .. PLACE_ID .. "&jobId=" .. game.JobId .. ")", inline = false }
                    })
                elseif multiplier then
                    -- Regular multiplier rift
                    log("Found regular rift: " .. name .. " with " .. multiplier .. " luck", true)
                    sendWebhook("🌈 Rift Detected!", {
                        { name = "Egg", value = name, inline = true },
                        { name = "Multiplier", value = multiplier, inline = true },
                        { name = "Time Left", value = timer, inline = true },
                        { name = "Height (Y)", value = tostring(math.floor(y)), inline = true },
                        { name = "Server ID", value = game.JobId, inline = false }
                    })
                else
                    -- Chest rift
                    log("Found chest: " .. name, true)
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
        log("No rifts found in this server", true)
    end
    
    -- Mark this server as scanned to prevent rescanning
    _G.RiftScanner.AlreadyScannedServer = true
    
    -- After scanning, wait before hopping
    log("Waiting 15 seconds before moving to next server...", true)
    wait(15)
    hopToNextServer()
end

-- Auto-continuation script for the next server
local CONTINUATION_SCRIPT = [[
-- Initialize global variables
_G.RiftScanner = _G.RiftScanner or {}
_G.RiftScanner.CurrentIndex = %d
_G.RiftScanner.SentNotifications = {}
_G.RiftScanner.AlreadyScannedServer = false

-- Wait for game to load
if not game:IsLoaded() then game.Loaded:Wait() end
wait(5) -- Additional wait to ensure everything loads properly

-- Start auto-dismiss for popups
spawn(function()
    -- Wait a bit before trying to dismiss popups
    wait(3)
    -- Look for popup GUIs that might contain OK buttons
    pcall(function()
        for _, gui in pairs(game:GetService("CoreGui"):GetDescendants()) do
            if (gui:IsA("TextButton") and (gui.Text:match("OK") or gui.Text:match("Okay") or gui.Text:match("Close"))) then
                pcall(function() gui.MouseButton1Click:Fire() end)
                pcall(function() gui:Destroy() end)
            end
        end
    end)
end)

-- Load and execute main script
loadstring(game:HttpGet('https://raw.githubusercontent.com/SubbyDubby/Roblox-Rift-Scanner/main/Rift.lua'))()
]]

-- Hop to next server with improved error handling
function hopToNextServer()
    local nextIndex = _G.RiftScanner.CurrentIndex + 1
    if nextIndex > #jobIds then
        nextIndex = 1 -- Loop back to beginning when reaching the end
    end
    
    local nextJobId = jobIds[nextIndex]
    log("Hopping to server " .. nextIndex .. " with JobID: " .. nextJobId, true)
    
    -- Update the current index immediately
    _G.RiftScanner.CurrentIndex = nextIndex
    
    -- Create continuation script
    local scriptToQueue = string.format(CONTINUATION_SCRIPT, nextIndex)
    
    -- Queue script to run after teleport
    if getgenv().queue_on_teleport then
        getgenv().queue_on_teleport(scriptToQueue)
        log("Using AWP.GG queue_on_teleport")
    elseif queue_on_teleport then
        queue_on_teleport(scriptToQueue)
        log("Using standard queue_on_teleport")
    elseif syn and syn.queue_on_teleport then
        syn.queue_on_teleport(scriptToQueue)
        log("Using Synapse queue_on_teleport")
    end
    
    -- Wait for queue_on_teleport to register
    wait(1)
    
    -- Set up a failsafe timer to move to the next server
    spawn(function()
        wait(15) -- Wait 15 seconds
        
        -- Check if we're still in the same server
        local currentServer = game.JobId
        if game.JobId == currentServer then
            log("Teleport likely failed or showing error. Moving to next server...", true)
            -- Don't reload the script, just increment the index and try again
            _G.RiftScanner.CurrentIndex = nextIndex + 1
            if _G.RiftScanner.CurrentIndex > #jobIds then
                _G.RiftScanner.CurrentIndex = 1
            end
            hopToNextServer()
        end
    end)
    
    -- Auto-dismiss any popups before teleporting
    pcall(function()
        for _, gui in pairs(game:GetService("CoreGui"):GetDescendants()) do
            if (gui:IsA("TextButton") and (gui.Text:match("OK") or gui.Text:match("Okay") or gui.Text:match("Close"))) then
                pcall(function() gui.MouseButton1Click:Fire() end)
                pcall(function() gui:Destroy() end)
            end
        end
    end)
    
    -- Attempt teleport
    log("Executing teleport...", true)
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
    log("All teleport methods attempted. Waiting for failsafe timer...", true)
end

-- Start auto-dismiss for popups
dismissErrorPopups()

-- Main execution starts here
log("Rift Scanner started", true)
log("Current server index: " .. _G.RiftScanner.CurrentIndex, true)

-- Wait for game to load completely
if not game:IsLoaded() then
    log("Waiting for game to load...", true)
    game.Loaded:Wait()
end

-- Wait for player character to load
if not LocalPlayer.Character then
    log("Waiting for character to load...", true)
    LocalPlayer.CharacterAdded:Wait()
end

-- Wait a bit for everything to initialize
log("Waiting 10 seconds before starting scan...", true)
wait(10)

-- Reset AlreadyScannedServer flag for this run
_G.RiftScanner.AlreadyScannedServer = false

-- Start scanning
scanRifts()
