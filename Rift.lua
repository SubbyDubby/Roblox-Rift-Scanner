-- Fully Automatic AWP.GG Rift Scanner
-- Configuration (EDIT THESE)
local WEBHOOK_URL = "https://discord.com/api/webhooks/1363251024210432164/B26f2Tvrl_QuigIZ5AJswcd1hYKPGxIHlYzUUu-cicdhF6kj2i5hrQi16-YK2-R7rk0Y" 
local WEBHOOK_URL_25X = "https://discord.com/api/webhooks/1363451259016712192/OIMNA2MKvtfFW2IZOj5zDyoqhDYFlV-uU1GARyJwWSPSVHQzDAvSThojSOf1n9f5E6de"
local PLACE_ID = 85896571713843

-- You can add as many job IDs as you want here (300+ is fine)
local jobIds = {
    "938bde92-e9ce-49d8-a670-754a19d644c0",
    "78cc195d-f881-4042-94b9-9bfbc2e7c77e",
    "b604a000-9c77-4fc2-beeb-1246b08391f6",
    "661d54a8-bce8-4a92-9477-aed7cf96279d",
    "17933e6f-6c54-4ecf-835f-ad23b033e309",
    "179b4780-2a77-4c6b-a66a-f1ba112a0464",
    "db7133de-2713-4c38-bf1f-49e010beed7b",
    "e39219e8-52a7-4165-a6c7-ef1a0e043fb0",
    "ad8e79c9-06c5-4bc1-8434-21ee954c541f",
    "cf98db9b-f8e5-4ef6-8568-a68b2841b324",
    "22b7a934-2e7e-4e21-8f84-f68dd692dace",
    "68ca873e-4334-4576-99aa-f7ddeeda1ace",
    "87293c96-c3ac-410d-a414-c8423afd99f1",
    "88d1443b-cfec-494e-afc4-abbaf583f7d4",
    "2f058dff-3f65-41ac-a7a0-25a3142c0b77",
    "a08706b4-4f6f-4a8e-98b8-dad6213dd3e6",
    "868e84a1-f557-4677-a2f9-2edb9f4aeaff",
    "2e8584ef-689e-4165-8fdd-4cb764589842",
    "5bd461e1-3005-46ed-80be-f3af6df3bc5f",
    "c7684588-bb02-463e-9bc8-a57f28b6f887",
    "d20544fc-ad02-4970-b539-4605bd070736",
    "a653a264-a249-40e2-b637-f5c7eda0e48d",
    "1f9c2962-a292-404d-8fdf-aae8dc1ed91c",
    "c28edd01-6f32-4506-9311-cc98a6a3b59a",
    "5915ca12-5a46-471e-8d39-31ed83854c87",
    "7f7c0f44-85bd-4211-8160-957373a871c3",
    "4c92bfe6-003d-405d-aa95-d4ec379189dd",
    "3fa06557-8cb0-462e-ba3b-effdce596bf1",
    "9ef4db97-748b-428a-80d8-ce5359ad189a",
    "f4252455-56a9-4e8f-9c56-43572b0d37a4",
    "a728bce1-7ad3-4802-b52a-990e65450b13",
    "aceb357c-3099-4ef7-b8bd-a4946c526b29",
    "c99d19a6-4538-4258-9b2e-a93c87867c77",
    "c49fcf75-bf25-4c9e-bf72-dea780508bf3",
    "772ac828-4f24-418b-b17a-e22feec5fe9e",
    "9a6d8546-30e1-4961-85fe-c8dbe5450f5c",
    "da767588-868b-4059-846a-d9ba5b72ec24",
    "c49cde0f-44dc-4287-b348-258ea3c65b51",
    "594b3e77-2a1a-4428-9c8d-ba4d47bb57f4",
    "7c264599-3350-4dd4-8ef5-372fd1156240",
    "a819f146-11ec-4dbe-9570-f7e9402b9ee8",
    "a6762bb9-1010-484b-93b6-2cf97a5cdc9e",
    "020cb1a5-cff5-4f16-955c-28eea807c623",
    "88d0b6ff-643f-4c84-bd93-5f1eaf336534",
    "133827ff-644d-4155-9725-32765dff2b9b",
    "c40ac56d-af1a-4c4d-acc7-23dece1e8f6c",
    "28111b4b-5682-4771-bcf3-7b2c633d6be9",
    "84006542-3e23-4ea3-a365-b8847ab3ffd5",
    "846e1094-ea31-4753-8748-c9ba671f864e",
    "aebf164a-036f-4d5c-a3f6-2a0e59f2e654",
    "3e1d5f24-fcdf-401d-9005-6a6ea76ab5c6",
    "0b026021-af39-4770-95ce-bf7a6871fd27",
    "6da8355f-e528-46bb-bb79-27eea65af3c8",
    "32853a6e-c2b3-4df0-9c4f-896e7822afb4",
    "c64b0456-4d0a-43cb-a39f-22473f9aba39",
    "ee69a362-484a-41f1-92a7-1d26864e6874",
    "44746b66-942d-4cb6-bd52-7c8bef706f9d",
    "556c4736-d23d-4d8d-81f2-63b4a38f1cc7",
    "2b4108fe-afdb-49fc-a909-e945bed8aa4e",
    "fc4f1cc3-2f12-42a1-9f87-4b108856b6ff",
    "862ababa-252c-49d8-b8fe-53c7b701f11d",
    "deb55e28-6a08-40ae-b294-1d37f52c566e",
    "3f82d16d-f0ab-48d5-8da2-679aaae9e994",
    "9738d04e-a847-4669-a55c-99d3a5f2e2be",
    "203c0d51-fa2c-4364-a49d-e994d197329b",
    "3882221d-b7ba-4793-a753-e6764fad8836",
    "23fa32dd-9611-4213-beee-411bd0f91da7",
    "6ae34b0e-e946-47e4-9f7c-6541c3c9a700",
    "08632bb9-1a0c-431a-b5fa-5727658504b6",
    "182e25ba-2133-4aff-94be-c33ebbb12c63",
    "bf7354ef-a1e1-4b13-a456-947e3b043b62",
    "b865d4bb-bced-4267-99d3-a8ffe9e244ba",
    "d7fd823f-56d4-4727-9573-3b77ea2f9c06",
    "db783145-d050-460f-b4b2-5800d44ae81b",
    "e4f3a349-5635-4204-9c89-1b73c3b0ed93",
    "e0115807-1611-4c8f-bc78-b13dfc2347e8",
    "a0a58769-2d40-406e-ad30-cc77c236996e",
    "68054527-6da2-464a-a71f-a77b6e5b8ae4",
    "8fb201b3-41a7-4ace-b767-ef08ef1eab15",
    "987d86c0-469b-456d-8b17-6dec539731d5",
    "b84dcea8-ff0d-4377-b33c-04339127e43e",
    "f41145fd-d10f-4afa-b9ea-b59acf32cb9f",
    "df51836f-1047-4e98-a2c0-7dd2883e45a8",
    "41ad09f2-5e22-4c20-afa5-9b29d03063af",
    "c80bf4c8-5e97-483a-a242-6c3e19d8cd98",
    "a4832ccc-03fe-43e6-b1d5-84b8bb7bf5b0",
    "2bff26b4-b0fc-4af5-b913-b476051d5b10",
    "664f6add-86e8-4d32-835a-5a4e48eb0f59",
    "ecb3c113-9a4d-42fb-bc0d-86670deb504a",
    "d0d4cb69-d939-4d4d-ada1-4cd4cdc4af43",
    "8fb3a4d7-f3f4-4dc0-99f1-51fa7bec19a7",
    "f70a3b7c-d153-4d15-a284-4268870d72a8",
    "7ee2d8d8-7035-4fb8-a325-4a1c6eec39e9",
    "009f101d-139a-46a2-8fb7-bc449e66199c",
    "80e5d1ba-1420-404f-9f78-2f2b89e59bdb",
    "6277a5cc-a8fb-46d0-b9a2-ba980d4560ea",
    "d42ebe1e-b04a-4360-a546-9c8e63d332d9",
    "0f95bf52-a7e5-4c16-93a2-be09a601d395",
    "8a6e6bee-e5d3-4dd2-b5cb-7501b5f259bb",
    "7873e99a-aca2-444f-87a7-e619cfe25c76",
    "9d942036-cef8-4f63-8d0c-f681380666b3",
    "890545ec-38a5-4ec1-a3e1-b6117be6c833",
    "a447493a-6320-4f4e-a9bc-99e6305a8688",
    "1c1bd318-2b44-445e-9ea2-a9fc294487b4",
    "4b9f816d-0c6f-4a57-b1a1-30c5c855abbf",
    "80af13d0-2752-4654-80ec-6edb6193e9fd",
    "3da71d52-0fa8-473b-8abb-747514406e9e",
    "15a38863-9548-42a1-ba8d-fc5f0f6db58d",
    "afca51c3-2751-4d4d-90ce-599284d6cccf",
    "fe67cce1-5f77-4289-9f40-a6d4d7093f9b",
    "c52a9e11-e0f4-4018-8688-d306603bfc41",
    "e4ec754c-6f2b-4186-a215-de1b2a9d1fe7",
    "f19e29cb-7eb2-4e0c-bafd-58d3af72f93f",
    "c4f1c8bc-b1c4-45df-9b1b-bcf16283aa17",
    "5347e1e5-4b89-4006-9349-0034670602cf",
    "9db60b0b-c2a2-4fa0-b9d0-fa4e04ad04ee",
    "4dd0b60e-e15f-48c2-bf0f-cc8caf8e5b88",
    "4a8f2c1c-cdf6-44e5-9d6e-32806faf4bbb",
    "55048463-41dd-4d26-a19f-bdef25cdf483",
    "c405903b-f66e-4a05-934f-d667076ad960",
    "892e515a-1cda-466c-98f3-a01ca06bad39",
    "f84c0044-f86d-4d30-8ddc-67df35a435c8",
    "9ac3c860-de76-4d90-b3b7-83ca0add134f",
    "d7707b92-b3a3-457c-a165-00ac37557945",
    "cd2eed28-e344-4664-ba54-95bf3bd5f274",
    "86329761-50c6-4c07-948f-fd5a95cf27f2",
    "3022f47c-8c7c-4e8c-bd1e-e2ec9d6e6025",
    "ce5e8a06-9534-4a4c-90fa-2f83facd01c4",
    "0c17a11c-d0aa-4eed-8605-ed9a31a5650d",
    "cb96c457-f612-4063-979c-d8761fa91c49",
    "b940b62f-2632-4e32-9f8c-47b708965d4e",
    "7da97823-d64f-48ed-a0d6-873daf5ede3e",
    "c3e01e29-023b-4b85-9238-434c792989b8",
    "23f42ad9-26d0-45d9-b2b2-373fdd085f09",
    "810d8542-0bb8-4125-8905-b41c915dcad1",
    "8d15f6b5-072f-4a56-8f16-6f9173ba1d83",
    "38ce8258-addf-4ce2-bbd0-aa003d7c87b9",
    "f047b9a7-a0de-49f8-8ca9-9dd998dafb61",
    "9c6801ba-bb8d-4349-b1b3-aea636c11db3",
    "dc0aedd5-7ab9-486c-8b4e-90a046d44bda",
    "f6f2fb41-29f3-4f82-8ace-f1907b25c24b",
    "7e964863-c64e-41fb-9dfc-bd1a83beac55",
    "eeb0b4ac-8914-47a0-958a-2318cb3a8260",
    "a21d58c2-8a3b-436d-bf32-ff5fd3a57fa0",
    "75fa9e51-379c-4ea8-86e2-f24b0c547cc9",
    "6ad3c659-f26b-46e6-b9aa-ea307cb012ed",
    "08fe1a7e-3db5-4a84-b71a-9c943bbcc09b",
    "08e703cd-20d7-4544-b01d-923c47542aab",
    "f6c7d36e-76a6-45e7-9aed-c9a0672cd01a",
    "87ec3394-4261-477d-87cc-414607daf64e",
    "27d8d03a-6b6f-4cff-b882-e1261ad69346",
    "85be8dd3-9ce5-44d1-808c-230063035ff5",
    "80fc5d0b-3fe9-4812-89bf-30cc023087e0",
    "a6f2ba10-4c8b-456f-b491-2afe011f845f",
    "76ae8b5d-0b94-4085-b1b5-9dcb1a046bd1",
    "ad512780-c085-467e-8a42-f647e8344bf7",
    "218ece28-cd22-406c-8e19-df76bb697b4b",
    "168cd3b0-e215-44ee-b695-f09c03188fac",
    "b8bb259d-3be7-4e37-a7ab-5204cf4af9f8",
    "aa1a817d-936a-4df4-b9e7-f5aa9a1b36be",
    "1a0c6e20-cc7e-4502-94dd-f53d346ee9ad",
    "6d58c873-d60e-4a91-a658-ad2b10099702",
    "79cd5320-8e53-41b9-8580-f50dc676efce",
    "a215f293-dc22-4c2f-9e03-673df22f0dbf",
    "16a1abe1-c924-4f86-8c2d-8a65c34b3d27",
    "64e25082-bbb6-42ac-84d4-7df1aba7544b",
    "031f440e-2d4c-4eb7-b3f1-b5e3e2f91373",
    "1408773a-1531-4a35-842c-062f6225b640",
    "9354293e-b791-4e4f-a006-d1f2bfe7ac22",
    "ce254e62-b0c3-4358-8cc6-59d250bb8d98",
    "3de0c71c-9b51-428f-badd-9d0dc93456e5",
    "8507ff35-4612-4b0b-bc2b-49f32b58b200",
    "ae310b39-25e3-4f48-a414-ec91f81c63fd",
    "db960616-75c1-406a-92ca-0d68e730ee01",
    "2912f08c-50c4-4755-b110-e9dcd871e71a",
    "a383dbd1-9cfc-47a0-bc7f-638201875778",
    "6211f310-53fb-4726-b9b1-009d6672d494",
    "8699fba0-8caa-4c32-9646-aa26d0ebca42",
    "1578dbbb-c9e1-4ba9-8549-fb6c14990d81",
    "06ca471f-ae4e-48e0-8a3f-88add5cbf207",
    "b3d0800d-d89d-42cf-b3d3-ba4b0ebfc235",
    "5c66c48a-85ef-4660-b8bd-cd21a20bb234",
    "f0b7bdf0-1998-4475-8f40-a948bd34ba0a",
    "5036f754-3509-4716-8827-1059b7bfd155",
    "acfdd96f-09e4-4d77-991f-51c3623f5367",
    "0e3b051c-f6a5-4c9e-9ba8-40753922b555",
    "d492af32-5e0f-4fa7-9aa4-14e70d058953",
    "68af33ad-61ee-4cd3-9ca8-bc46c2193bb5",
    "ca8fcf36-19de-46d0-ac21-5c18462f1688",
    "81ae19fc-df98-4ba7-825b-9b25f5c5c84b",
    "be5ef998-f250-4533-8e4b-0699e33e20f3",
    "82698d32-e2a1-4041-af99-1827bc639861",
    "25ba87d0-d7f7-4e8b-8475-51cf12203d36",
    "d5a442d7-072a-4ef1-a916-23806fb31f25",
    "b2f405dc-a8da-43fc-949d-38c1c1eb39f3",
    "6d7b1ab5-bafe-435a-a4ba-4b4573f9b1f7",
    "c123ab08-0f16-4889-bce9-ad00e5025ae3",
    "358a31c8-f593-42d0-92b3-389ca512a946",
    "77da67ee-ee7b-4776-9c3b-afba9fa95ccb",
    "a54930f1-fcaa-459c-ba96-b103b09139eb",
    "6b9119de-a48a-4039-9ad3-6e13e00a55fa",
    "88d91982-9337-4894-a473-32d6a714a616",
    "951f5e2d-b88e-41bf-8d10-fe1aa49d9fa4",
    "dcecb76c-f836-489e-b1a2-fcf40068afa3",
    "1929f87a-fe4b-44e5-b299-0626418ef93b",
    "a4855a59-a8da-4ace-8e30-aee0d6dd5786",
    "5f8284d6-6447-4c69-afcd-b0688d1566b0",
    "ce90c239-558e-4d43-bb5b-e118dcb5a549",
    "2173d775-5b31-4ac2-a02d-47bd7150c6a1",
    "d0057c94-1ff0-403f-9765-561f80c0834a",
    "3fb666c1-d4da-4b44-8729-c855d57cf0a4",
    "2a78bb19-48f7-4ac0-bd35-759bf8d97538",
    "58c4e8bb-f3e5-4cf7-b955-9de9dc0537e3",
    "fef1a23d-035c-488b-b0fb-f8410ac3c8a1",
    "c5d33eff-7d33-4532-89ad-a28cb2bc716d",
    "819cec99-b1b8-4c03-9a38-6aafa3596cab",
    "32607c74-46a5-41b5-8beb-7f930fa9386e",
    "85f10cb5-8140-49e9-a1cd-bcd421d37fe5",
    "1d92ccb8-4f69-410f-9d2c-45ff913554d8",
    "9ebb331e-0854-48a9-bd68-96d13644af37",
    "0a04d9ad-c41d-467c-92dd-431067bd10ee",
    "43b5c9f2-4ae7-4b6c-9960-abbc6e94dd2d",
    "41dd7eaf-e4d4-4e96-9f16-9c8650a2879f",
    "97fd0f4b-1377-4379-b5c3-f7f1a8a538ca",
    "8a3cc76b-9c4b-41a5-b95c-dd9650d0e5a4",
    "6ecd5b0c-8ac6-4505-b024-2f4c0f97a06b",
    "2fcc4945-aa8b-4a88-a091-a33f664c709b",
    "5276800a-ef3d-4d37-ad7e-d5119554f112",
    "9e827818-c5db-4b92-a9cb-51f6ab6e2056",
    "9d497324-19d0-4f90-80fd-fbd9ad9b24bf",
    "729b040a-ee56-402b-ad36-a5fddc09eb4c",
    "506b5f96-8cb6-4e4e-90ee-e845c89efcd6",
    "2ac7acf2-774b-4809-9a9b-dc7cf5ca55fd",
    "1a89e5d3-0c17-4c16-aaf5-fa24effaaf87",
    "3da23874-f553-4267-b3ed-d610d09fc26e",
    "52fee390-6097-4ca6-8eac-8755515fde54",
    "fc002f8c-a194-4ac7-a32c-380c7d7ceef8",
    "1796455c-cf53-47e5-b01b-9fd3ce20a3b4",
    "12284e45-4137-4e81-8905-e6ba3137dd76",
    "80ed4354-781c-4b3f-bf19-bbedb38e1198",
    "05bc8043-f28c-44d9-a4bc-ed3855c0140b",
    "fb8449bf-5747-4177-ae7c-c71488486092",
    "22ba1a66-8e95-497d-844c-b9504ed1f413",
    "20bd556e-6bbb-4ee6-948b-e90287493cdc",
    "bd548342-710c-4783-a8fa-ae840da93687",
    "96afadcf-3951-4e6a-8d04-303f07b39a4e",
    "e14067e0-8e86-40e9-8caf-be565f0a6d43",
    "4d6e38fc-e934-4e25-bcef-31780ad070fb",
    "ff749dac-9e01-4421-9ce6-5ffc1226fcfa",
    "206dc45f-67ec-422f-9f09-5620d617d3ea",
    "39b446fa-d49b-4d1f-921e-11c89fc6815f",
    "75017933-ee6d-4fd9-8490-4e6d5b3d88d9",
    "0c18846b-c718-4333-890a-019af77041fb",
    "258a272b-7a2e-43cb-9ab0-ce69710334d4",
    "7f94a3cc-231e-4330-b940-fb51de91598b",
    "48b37ed5-2dbd-41b3-808c-f2e0f8587ec3",
    "cf0d228a-615e-42ff-9d87-195a70e9ce3f",
    "c29804c0-e6c4-455a-93a7-377735204b51",
    "4dde1dd5-8394-4ef0-9988-367877d6b4ab",
    "43fcdb24-80e1-418f-8ce9-3f4b80ea1358",
    "6844e795-6283-4d26-b0bb-18d60b2bfea1",
    "4700ac87-298b-46b2-b33b-0ac4e6e4641a",
    "58176ab3-4a4d-4e0d-aa66-ce73b4851ce6",
    "f1084cad-d48b-4f31-b38b-bbccd69f14ca",
    "f3330dcc-23c6-449f-919d-c7575447935f",
    "b139d61f-e0c4-4ad3-9fb2-1ac73421f8ac",
    "31996c80-c036-42e2-b776-5117ea4d4d19",
    "0c9f5b2a-028b-46cd-8372-f38adc19b251",
    "cf710d0a-5243-4266-8ee3-0d69e8c48b0e",
    "6ec27343-5862-45af-b6c8-129afd981585",
    "f0c12739-8769-4689-864f-ea4cf26e8223",
    "d4814c95-cf32-41be-81da-82fe1ce4bfb0",
    "5d4964de-2e9b-438e-8dac-56a2a93e8a26",
    "4195c7b0-a8fe-4042-9b79-f3b9fa09c7ae",
    "eb3b87b8-5258-47e1-a2a3-05c4d57d8db5",
    "ef38d696-5a38-4639-8765-9bcfc402158f",
    "dac7e99c-82ab-43a0-8f4c-7a4455686bd5",
    "3956f39e-8c01-455a-8f93-e151955bf51b",
    "3dc5df7a-bcca-4005-bd3b-5b290fd05162",
    "ad36b60a-c003-45bf-ac83-59b032987edf",
    "f5f1376e-3365-455b-bc01-67428d0bdcd0",
    "2dbf01c4-f2da-4fff-9805-e50dc0fc64c3",
    "6aee99ef-252e-43ef-bd2c-32504b497ebe",
    "c33b0a82-9448-4565-9ba1-fd3c28a48b06",
    "6ce7073a-0ba6-4b4c-be59-8d5b516573c5",
    "1e1562dd-b182-4ce0-af75-16c3fa895c25",
    "c52b835c-82ce-4235-92fe-f0ae2749045f",
    "c0952a61-9e5d-4b2b-929c-2c9896d0afd4",
    "d5213f02-2662-4f15-811f-f9d83624672d",
    "fd013737-982c-4bd6-b5ee-f2b5791d1222",
    "18c0e779-db62-4444-8be5-478525917269",
    "110aacf0-0702-45ad-a53a-dabed818326b",
    "495622ac-e964-4082-8cc8-aff334993795",
    "c332742f-d3c4-4503-9dd9-59b3e45a2092",
    "5a094afc-b617-407d-bffb-d91a843c695f",
    "97f13f70-959e-4a38-8691-91abe9622540",
    "6980b7e1-91ab-4133-afcf-f619bc023c63",
    "ea5d7313-61f9-4d0d-bcea-f31c2a93d855",
    "a72e1f67-8caa-4614-862a-ebcb98b42d8c",
    "1113b52d-84f7-4bb6-81b1-e623904b6545",
    "a3bdcdaa-f6d4-4014-8997-e24c4f1a9b39",
    "495e8c33-1c7a-40b3-91bf-26a8dd7c9c0c",
    "f455ebc9-bad4-47d9-b79f-cab68e201adb",
    "63177d9c-32f3-46c4-8f4d-fdd9bda884fb",
    "5e29f6d9-0c1f-44b8-b793-e229cd4e33e4",
    "d6494340-7df3-4624-af20-e9044019d773",
    "b9788c50-c009-4807-9bc6-ff7593ab8e4a",
    "744f07a0-a6e4-425b-80a8-969758ffa2c8",
    "de44679e-8d3e-4bde-be2f-4c153348b15b",
    "6ef3f8bb-4072-46f0-9f8d-14eab2299aa7",
    "7a06edb6-f451-4d6b-b371-24dd68a5b5d1",
    "1c9b9567-db16-44c4-99f4-6fae185d5806",
    "b998dccd-c2fc-4f03-a667-bfb50c19fe3f",
    "17e981b4-92e5-421c-865b-288e7d33113b",
    "cfd95c7d-4ad6-4979-9190-593d07d77c07",
    "faefce3e-694e-4e12-9f0d-c05ca87f1a8f",
    "52e67271-9aa1-4a1f-9ace-b08a333ba432",
    "b2b2f9b5-e440-4f09-9331-cc9d0d2e1b16",
    "0ea11f9b-c9e8-4598-8b82-262d6769c681",
    "41298e51-ff79-4c06-9a3a-8d70ce553648",
    "f6006d9b-24dc-46a0-bd7e-fefc0124d0d7",
    "ad519b49-96f9-4a45-8161-f413ef574a37",
    "f2a74374-6c69-4a02-a57a-de50302bcfc4",
    "c0773570-5f64-4f89-a9dd-725d9a95a219",
    "62bd48cf-2182-43e3-9b6b-9efd2c064d69",
    "eb2a07d4-080b-4823-abce-fbe96d45d4d3",
    "dd766c68-3a89-4982-b043-cd493cf2184b",
    "9e5af008-29d2-4150-b860-7aa1d1c4be4c",
    "2cc0bd16-855a-43c1-a6bf-753043c081d2",
    "cb88976f-1e7c-4835-b88b-19757b8b4f79",
    "6b5db3c7-3037-41e7-9bc0-bbfd38f28048",
    "5ed0d37e-1ff7-44f4-8ae9-959c13eee8ac",
    "0430acdd-eb3d-4af6-ac80-b2f1093cac1e",
    "42b16084-37d0-4bbf-acab-1921a7bfa707",
    "532ffb8c-6044-4026-9569-f8f9a0bef45b",
    "3a0916bb-5a36-4ee9-ba91-80f1419c8f61",
    "6e4a267b-7d0e-4846-b4e4-2db0bf48ee50",
    "f8820179-44e4-4c65-a21e-8d142858cab1",
    "f54acd09-84e5-4536-b948-2d4112d1ecd9",
    "863c07f6-d6cb-44cb-981b-512620601ad1",
    "2469c6df-7c5f-4161-b1fc-8a834e4a2daa",
    "14d390e2-a7f7-485c-ba1b-674487006b5f",
    "72c36ba9-77f1-4a45-a5ec-6003678a5d16",
    "650a6537-3514-41d7-a15f-9dd7ce6073f5",
    "35a93267-a4b7-45f9-bfb2-350df89efbdd",
    "dd3f9228-ba80-41b4-94c4-d0c71e1c8840",
    "86d60bb6-7236-40cf-9fdd-042eac1086a3",
    "6bc5575c-d700-482e-95f5-7d3f9a1a6300",
    "18158306-03a4-4f5a-81d1-fb086a84ceb5",
    "e84696be-0e6c-46cb-a528-35fd26fe6232",
    "48daf524-f295-47a8-8a02-026af2536f63",
    "cbc5eb42-bb22-46bd-977c-c9251cc9ee2d",
    "21e4a817-262d-49f5-9b5c-2389c3fef382",
    "f6aa68bc-81c5-442f-8ac5-bdc4caa3750f",
    "4028fca8-13de-49af-8470-551661422c95",
    "a7784c86-9946-4aa5-a112-18d30fcc0090",
    "54df6bd9-5e4d-4c14-9c0d-4d2863ec81b8",
    "e0cd0bcc-d80a-4d7b-b551-5037e2bc12b5",
    "5f600d3e-a6d2-484f-98c1-a2e9edddf9f1",
    "304a4b87-ef87-4c79-855d-36decdeeb973",
    "cee703c6-9bd8-40b1-88b9-815def4ee2d0",
    "c5f1e2a3-1cac-4202-8397-7a4ad932f3fa",
    "3222ae8a-7805-4155-aed0-e546b980708f",
    "7bfd2046-3593-4cea-ae69-7520a883189b",
    "e787c83a-5732-4e0c-9dcd-054bfc80c166",
    "d19dd67e-7830-43a5-b253-136e7f518a43",
    "3cfe097c-d62b-4650-ac3b-936ea89e7a7c",
    "4f748110-e952-4cf0-8803-8ee933680c38",
    "047c2391-725d-44b7-b177-27dfdacfaba7",
    "4e8df11e-b0ea-49fb-b2eb-b53fab2d97b5",
    "08e8037f-8777-495a-be6b-d0f9ebe565e4",
    "9ecadbe5-6c0a-4190-8bd2-2ca819e9b336",
    "36e6b52e-04b5-4073-9695-58d2e6fade69",
    "61667abc-1323-43a2-beaf-5f5fbe511596",
    "7c3e3d83-dcf5-4608-b170-d08b4b9e93c8",
    "6d706cb5-a3bc-41b3-8207-557c31930d0d",
    "b5bd7997-5484-41a5-9b30-0f8a3d2ad088",
    "c727dcb2-40da-42db-9af1-01d86f316151",
    "17c79423-8ca3-453b-8ce3-967ef7abbdd1",
    "b56e3b7d-80ee-438c-bb06-bdab0f3e5e5e",
    "4abd5224-216a-4291-b59b-7feea96de442",
    "cc7e884b-5711-4e1b-92ea-e8d97a9c9779",
    "74b37bd6-95ba-43ad-8a30-1f411a45a3cf",
    "f9a82fb0-6846-45ec-b932-b168fee80212",
    "50653646-edd6-4542-a390-513ee2237b39",
    "9ea35051-1d77-4f1b-90de-be1e05221956",
    "d99bf659-6dee-4a65-a8ad-5d2149d3b9d0",
    "9d044b5a-33da-4c69-b5d2-eee56cec3581",
    "e09b865c-d5c6-48b6-909f-f3f38b55f95e",
    "ce284ddf-01b2-4a35-a952-7355922e1381",
    "67df6477-599e-47c6-bddd-84674e3ee042",
    "b2824daa-ff26-4d98-943b-0f4d0d014f93",
    "ca2f34c0-e370-4608-ab57-62b39d237e37",
    "a6b10db4-ef98-41a5-a42d-ea6e484f9695",
    "02878cfd-386d-4a5a-8df8-bc69aad691ff",
    "ebb73f59-1a28-417b-82d7-b9fb1f883681",
    "3b81339e-5a3c-4b0e-9eca-2df0af3dcf69",
    "1a3255fc-b627-49c5-9cd6-d4817995d712",
    "26dc2cd6-db66-443d-a48c-277741590b58",
    "247fd574-41e2-4ea7-b81b-a2b9835deae9",
    "2943f9e3-1226-4f16-be4b-7629bfdc3ac2",
    "2c63b2ba-2621-420f-ab66-4393ce49f92b",
    "f58a5c34-c88d-4326-ad02-7da9153104b5",
    "f21c5579-efd5-4da3-ae2b-04ff437c8619",
    "2bc56e4f-4cd6-4e29-a346-44f72b74e0de",
    "1e360592-4d2f-4c15-9907-2464ab584c60",
    "5fc164d9-ad94-4a1b-a015-dcfbb50e7678",
    "5809ef1f-7078-47a4-ad93-257356c76f6e",
    "ade7e101-8cc5-4ce4-bbb1-b3b22ec0a824",
    "73810446-d737-429c-84b1-26e6a63220c0",
    "82d18f5d-6171-44e0-9f00-8d466c554530",
    "f921a8a9-cc2a-4754-8891-e56a44b6e6da",
    "e470d4b2-8ad4-454f-aeaf-2a4ed305625e",
    "f7e443b6-9a4d-4ae2-bcc1-149a9de13cb6",
    "82a0032f-4436-476c-9a9c-07667a608658",
    "5fe08d34-c495-42a0-a03b-26ebbb7aa27e",
    "eb3efc90-1187-4f00-899f-a17618fcd8e6",
    "f96de174-afe4-4a18-be66-98a198aa2300",
    "bb802102-7d67-4103-8c3f-b767f66ff113",
    "a7474bc9-7b92-4899-8c05-97beb8d7ec5f",
    "d51addbc-454f-4a1c-80b9-b17602a78cd3",
    "c0d316ed-5418-4644-883e-6d418b8efc8f",
    "c9c11aac-9bc1-44d0-85b1-dfb6baa9f911",
    "0615706f-6edb-4a7c-8c34-3c50f31e263f",
    "c70219a5-e297-4b02-a6c6-3f5012324d82",
    "b4c65a76-c805-42b9-9cc5-a2dab4f46c4b",
    "136dce02-c446-41fd-a290-e04cb69a6a35",
    "c86476b7-e8c6-4117-a5e7-f32f0a8a102b",
    "927c0b0f-491e-4ed1-8831-de0c0510069e",
    "d8496e7f-230f-4e42-b233-63320528fbf4",
    "cb9bbc8d-ad37-43db-85a3-61c21bbfb42b",
    "6750ad0e-8868-46ac-95bd-e7c621d7c952"
}

-- Services (needed for randomization)
local Players = game:GetService("Players")

-- Ensure truly random starting position
math.randomseed(tick() + os.time() + (Players.LocalPlayer.UserId or 0))
-- "Warm up" the random number generator
for i = 1, math.random(5, 10) do math.random() end

-- Initialize or restore global state
if not _G.RiftScanner then
    -- Start from a random job ID in the list, using account-specific randomization
    local accountOffset = (Players.LocalPlayer.UserId % 997) or math.random(1, 997)
    _G.RiftScanner = {
        CurrentIndex = (math.random(1, #jobIds) + accountOffset) % #jobIds,
        SentNotifications = {},
        AlreadyScannedServer = false
    }
    if _G.RiftScanner.CurrentIndex == 0 then _G.RiftScanner.CurrentIndex = 1 end
    print("Starting with random job ID index: " .. _G.RiftScanner.CurrentIndex)
else
    print("Continuing from previous session")
end

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
