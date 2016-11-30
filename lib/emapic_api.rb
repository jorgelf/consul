require 'net/http'
require 'openssl'

class EmapicApi

  def self.get_json(options = {})
    print_debug_start("to get the JSON")

    uri = build_uri('/api/test')
    http = build_http_object(uri)
    request = Net::HTTP::Get.new(uri)
    request.basic_auth(api_key, api_secret)

    response = http.request(request)

    puts "Response body: #{response.body}"
    print_debug_end(response.code)

    if options[:fake_data]
      district_perimeter = %|{type:"FeatureCollection",features:[{type:"Feature",properties:{name:"Palacio",cartodb_id:1,created_at:"2013-12-02T07:16:22+0100",updated_at:"2013-12-02T07:16:22+0100"},geometry:{type:"MultiPolygon",coordinates:[[[[-3.704621,40.421469],[-3.705029,40.421354],[-3.706807,40.421419],[-3.706605,40.421049],[-3.706691,40.420811],[-3.706828,40.420346],[-3.706879,40.420067],[-3.707141,40.419581],[-3.707164,40.419541],[-3.707216,40.419454],[-3.707472,40.419009],[-3.70727,40.418979],[-3.707365,40.418399],[-3.707394,40.418295],[-3.707416,40.418204],[-3.707378,40.41796],[-3.707376,40.417942],[-3.707346,40.41767],[-3.707314,40.417558],[-3.707387,40.417474],[-3.707357,40.417162],[-3.707409,40.417031],[-3.707502,40.416763],[-3.7073,40.416508],[-3.707238,40.416503],[-3.707173,40.4165],[-3.707123,40.416468],[-3.706879,40.415927],[-3.706723,40.415704],[-3.706807,40.415293],[-3.706949,40.414899],[-3.706416,40.414759],[-3.706169,40.414701],[-3.706119,40.41452],[-3.706264,40.413768],[-3.706407,40.413653],[-3.706925,40.412541],[-3.707119,40.41244],[-3.707174,40.412349],[-3.70784,40.411558],[-3.708794,40.410345],[-3.708919,40.410199],[-3.709736,40.409183],[-3.710369,40.407846],[-3.710739,40.407926],[-3.712384,40.408625],[-3.713922,40.409264],[-3.715461,40.409879],[-3.717029,40.412294],[-3.716542,40.413259],[-3.71563,40.415097],[-3.71723,40.415095],[-3.718123,40.415116],[-3.718328,40.415121],[-3.719186,40.415134],[-3.721644,40.415171],[-3.721541,40.416513],[-3.72107,40.418356],[-3.720851,40.419217],[-3.720744,40.419641],[-3.720533,40.419762],[-3.7202,40.419952],[-3.719757,40.4203],[-3.71939,40.420651],[-3.71909,40.421076],[-3.718989,40.42125],[-3.718886,40.421426],[-3.71888,40.421436],[-3.716751,40.421506],[-3.715493,40.421523],[-3.71467,40.421535],[-3.714195,40.421584],[-3.714195,40.421584],[-3.712587,40.422659],[-3.712072,40.423003],[-3.712022,40.423086],[-3.711865,40.42324],[-3.711734,40.423369],[-3.710413,40.424145],[-3.709853,40.424473],[-3.709608,40.424603],[-3.709585,40.424615],[-3.70886,40.42413],[-3.70662,40.422724],[-3.704621,40.421469]]]]}}]}|
      bunch_of_points = %|{"type":"FeatureCollection","features":[{"type":"Feature","geometry":{"type":"Point","coordinates":[174.7685,-36.879]},"properties":{"file":"auckland_new-zealand.geojson","name":"Auckland, New Zealand"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[153.3565,-27.961]},"properties":{"file":"gold-coast_australia.geojson","name":"Gold Coast, Australia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[172.455,-43.4825]},"properties":{"file":"christchurch_new-zealand.geojson","name":"Christchurch, New Zealand"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[115.1215,-8.256]},"properties":{"file":"bali_indonesia.geojson","name":"Bali, Indonesia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[153.0245,-27.3615]},"properties":{"file":"brisbane_australia.geojson","name":"Brisbane, Australia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[175.4725,-41.1365]},"properties":{"file":"wellington_new-zealand.geojson","name":"Wellington, New Zealand"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[130.9115,-12.4185]},"properties":{"file":"darwin_australia.geojson","name":"Darwin, Australia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[106.7975,-6.248]},"properties":{"file":"jakarta_indonesia.geojson","name":"Jakarta, Indonesia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[152.995,-26.6755]},"properties":{"file":"sunshine-coast_australia.geojson","name":"Sunshine Coast, Australia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[149.1425,-35.237]},"properties":{"file":"canberra_australia.geojson","name":"Canberra, Australia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[115.8235,-32.102]},"properties":{"file":"perth_australia.geojson","name":"Perth, Australia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[138.6355,-34.9155]},"properties":{"file":"adelaide_australia.geojson","name":"Adelaide, Australia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[151.1375,-33.913]},"properties":{"file":"sydney_australia.geojson","name":"Sydney, Australia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[145.038,-37.9585]},"properties":{"file":"melbourne_australia.geojson","name":"Melbourne, Australia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[145.722,-16.9315]},"properties":{"file":"cairns_australia.geojson","name":"Cairns, Australia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[51.5205,25.294]},"properties":{"file":"doha_qatar.geojson","name":"Doha, Qatar"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[35.2065,31.789]},"properties":{"file":"jerusalem_israel.geojson","name":"Jerusalem, Israel"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[29.015,40.235]},"properties":{"file":"bursa_turkey.geojson","name":"Bursa, Turkey"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[39.211,21.455]},"properties":{"file":"jeddah_saudi-arabia.geojson","name":"Jeddah, Saudi Arabia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[46.7145,24.695]},"properties":{"file":"riyadh_saudi-arabia.geojson","name":"Riyadh, Saudi Arabia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[34.847,32.0875]},"properties":{"file":"tel-aviv_israel.geojson","name":"Tel Aviv, Israel"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[36.2855,33.4585]},"properties":{"file":"damascus_syria.geojson","name":"Damascus, Syria"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[44.5915,40.155]},"properties":{"file":"yerevan_armenia.geojson","name":"Yerevan, Armenia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[35.9825,31.9195]},"properties":{"file":"amman_jordan.geojson","name":"Amman, Jordan"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[55.2335,25.137]},"properties":{"file":"dubai_abu-dhabi.geojson","name":"Dubai, Abu Dhabi"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[44.324,33.341]},"properties":{"file":"baghdad_iraq.geojson","name":"Baghdad, Iraq"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[34.804,31.2415]},"properties":{"file":"beer-sheba_israel.geojson","name":"Beer Sheba, Israel"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[69.17,34.5155]},"properties":{"file":"kabul_afghanistan.geojson","name":"Kabul, Afghanistan"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[27.0795,38.4175]},"properties":{"file":"izmir_turkey.geojson","name":"Izmir, Turkey"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[51.259,35.65]},"properties":{"file":"tehran_iran.geojson","name":"Tehran, Iran"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[39.8465,21.4345]},"properties":{"file":"mecca_saudi-arabia.geojson","name":"Mecca, Saudi Arabia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[69.2545,41.271]},"properties":{"file":"tashkent_uzbekistan.geojson","name":"Tashkent, Uzbekistan"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[49.855,40.3955]},"properties":{"file":"baku_azerbaijan.geojson","name":"Baku, Azerbaijan"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[35.335,37.01]},"properties":{"file":"adana_turkey.geojson","name":"Adana, Turkey"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[35.505,38.715]},"properties":{"file":"kayseri_turkey.geojson","name":"Kayseri, Turkey"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[10.911,43.9865]},"properties":{"file":"pistoia_italy.geojson","name":"Pistoia, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-8.4255,40.209]},"properties":{"file":"coimbra_portugal.geojson","name":"Coimbra, Portugal"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[13.3785,38.033]},"properties":{"file":"palermo_italy.geojson","name":"Palermo, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[8.779,44.426]},"properties":{"file":"genoa_italy.geojson","name":"Genoa, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[16.5715,40.6665]},"properties":{"file":"matera_italy.geojson","name":"Matera, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-7.955,37.021]},"properties":{"file":"faro_portugal.geojson","name":"Faro, Portugal"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[9.1645,39.2255]},"properties":{"file":"cagliari_italy.geojson","name":"Cagliari, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[10.4,43.7035]},"properties":{"file":"pisa_italy.geojson","name":"Pisa, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[7.6395,45.068]},"properties":{"file":"turin_italy.geojson","name":"Turin, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-2.959,43.2715]},"properties":{"file":"bilbao_spain.geojson","name":"Bilbao, Spain"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-3.6045,37.1745]},"properties":{"file":"granada_spain.geojson","name":"Granada, Spain"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[8.2025,44.9185]},"properties":{"file":"asti_italy.geojson","name":"Asti, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-5.734,43.427]},"properties":{"file":"gijon_spain.geojson","name":"Gijon, Spain"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[23.685,37.9395]},"properties":{"file":"athens_greece.geojson","name":"Athens, Greece"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-6.2,36.575]},"properties":{"file":"cadiz_spain.geojson","name":"Cadiz, Spain"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[12.477,41.854]},"properties":{"file":"rome_italy.geojson","name":"Rome, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[10.2235,45.517]},"properties":{"file":"brescia_italy.geojson","name":"Brescia, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[22.9465,40.6215]},"properties":{"file":"thessaloniki_greece.geojson","name":"Thessaloniki, Greece"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[12.182,45.467]},"properties":{"file":"venice_italy.geojson","name":"Venice, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.3605,39.462]},"properties":{"file":"valencia_spain.geojson","name":"Valencia, Spain"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-3.7,42.3535]},"properties":{"file":"burgos_spain.geojson","name":"Burgos, Spain"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[11.4075,44.5025]},"properties":{"file":"bologna_italy.geojson","name":"Bologna, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-9.046,38.754]},"properties":{"file":"lisbon_portugal.geojson","name":"Lisbon, Portugal"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-7.915,38.562]},"properties":{"file":"evora_portugal.geojson","name":"Evora, Portugal"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[14.2465,40.854]},"properties":{"file":"naples_italy.geojson","name":"Naples, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[11.243,43.792]},"properties":{"file":"florence_italy.geojson","name":"Florence, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[11.109,46.066]},"properties":{"file":"trento_italy.geojson","name":"Trento, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[9.165,45.47]},"properties":{"file":"milan_italy.geojson","name":"Milan, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[2.105,41.3895]},"properties":{"file":"barcelona_spain.geojson","name":"Barcelona, Spain"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[10.468,43.859]},"properties":{"file":"lucca_italy.geojson","name":"Lucca, Italy"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-8.3,43.4]},"properties":{"file":"acoruna_spain.geojson","name":"Acoruna, Spain"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-3.675,40.415]},"properties":{"file":"madrid_spain.geojson","name":"Madrid, Spain"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-5.9595,37.39]},"properties":{"file":"seville_spain.geojson","name":"Seville, Spain"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-3.9965,43.138]},"properties":{"file":"cantabria_spain.geojson","name":"Cantabria, Spain"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-8.718,42.238]},"properties":{"file":"vigo_spain.geojson","name":"Vigo, Spain"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-8.5765,41.19]},"properties":{"file":"porto_portugal.geojson","name":"Porto, Portugal"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[10.818,63.313]},"properties":{"file":"trondheim_norway.geojson","name":"Trondheim, Norway"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[10.592,59.681]},"properties":{"file":"oslo_norway.geojson","name":"Oslo, Norway"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[18.192,59.4835]},"properties":{"file":"stockholm_sweden.geojson","name":"Stockholm, Sweden"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[5.317,60.386]},"properties":{"file":"bergen_norway.geojson","name":"Bergen, Norway"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[10.212,56.166]},"properties":{"file":"aarhus_denmark.geojson","name":"Aarhus, Denmark"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[24.8605,60.366]},"properties":{"file":"helsinki_finland.geojson","name":"Helsinki, Finland"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[12.941,55.5825]},"properties":{"file":"malmo_sweden.geojson","name":"Malmo, Sweden"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-21.983,64.034]},"properties":{"file":"reykjavik_iceland.geojson","name":"Reykjavik, Iceland"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[23.7025,61.6175]},"properties":{"file":"tampere_finland.geojson","name":"Tampere, Finland"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[11.931,57.6675]},"properties":{"file":"gothenburg_sweden.geojson","name":"Gothenburg, Sweden"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-65.7575,-19.5815]},"properties":{"file":"potosi_bolivia.geojson","name":"Potosi, Bolivia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-64.1535,10.445]},"properties":{"file":"cumana_venezuela.geojson","name":"Cumana, Venezuela"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-76.9975,-12.001]},"properties":{"file":"lima_peru.geojson","name":"Lima, Peru"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-75.482,10.4115]},"properties":{"file":"cartagena_colombia.geojson","name":"Cartagena, Colombia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-46.61,-23.721]},"properties":{"file":"sao-paulo_brazil.geojson","name":"Sao Paulo, Brazil"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.899,-2.1595]},"properties":{"file":"guayaquil_ecuador.geojson","name":"Guayaquil, Ecuador"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-68.7625,-11.0245]},"properties":{"file":"cobija_bolivia.geojson","name":"Cobija, Bolivia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-68.164,-16.5395]},"properties":{"file":"la-paz_bolivia.geojson","name":"La Paz, Bolivia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-64.184,-31.395]},"properties":{"file":"cordoba_argentina.geojson","name":"Cordoba, Argentina"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-34.4365,-8.0435]},"properties":{"file":"recife_brazil.geojson","name":"Recife, Brazil"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-62.2485,-38.786]},"properties":{"file":"bahia-blanca_argentina.geojson","name":"Bahia Blanca, Argentina"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-51.265,-30.0545]},"properties":{"file":"porto-alegre_brazil.geojson","name":"Porto Alegre, Brazil"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-61.02,14.634]},"properties":{"file":"martinique_french-caribbean.geojson","name":"Martinique, French Caribbean"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-58.5455,-34.679]},"properties":{"file":"buenos-aires_argentina.geojson","name":"Buenos Aires, Argentina"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-57.5225,-25.2935]},"properties":{"file":"asuncion_paraguay.geojson","name":"Asuncion, Paraguay"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-43.964,-19.9025]},"properties":{"file":"belo-horizonte_brazil.geojson","name":"Belo Horizonte, Brazil"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.094,4.6565]},"properties":{"file":"bogota_colombia.geojson","name":"Bogota, Colombia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-43.3055,-22.797]},"properties":{"file":"rio-de-janeiro_brazil.geojson","name":"Rio De Janeiro, Brazil"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-64.7325,-21.543]},"properties":{"file":"tarija_bolivia.geojson","name":"Tarija, Bolivia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-56.1735,-34.8625]},"properties":{"file":"montevideo_uruguay.geojson","name":"Montevideo, Uruguay"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-67.1115,-17.959]},"properties":{"file":"oruro_bolivia.geojson","name":"Oruro, Bolivia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-70.698,-33.4875]},"properties":{"file":"santiago_chile.geojson","name":"Santiago, Chile"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-63.1595,-17.7945]},"properties":{"file":"santa-cruz_bolivia.geojson","name":"Santa Cruz, Bolivia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-78.4765,-0.2205]},"properties":{"file":"quito_ecuador.geojson","name":"Quito, Ecuador"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-66.8865,10.4575]},"properties":{"file":"caracas_venezuela.geojson","name":"Caracas, Venezuela"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-49.251,-25.435]},"properties":{"file":"curitiba_brazil.geojson","name":"Curitiba, Brazil"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-38.3415,-12.886]},"properties":{"file":"salvador_brazil.geojson","name":"Salvador, Brazil"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-65.2655,-19.0285]},"properties":{"file":"sucre_bolivia.geojson","name":"Sucre, Bolivia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-54.6735,-20.511]},"properties":{"file":"campo-grande_brazil.geojson","name":"Campo Grande, Brazil"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-66.212,-17.3485]},"properties":{"file":"cochabamba_bolivia.geojson","name":"Cochabamba, Bolivia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-61.68,10.4425]},"properties":{"file":"trinidad-tobago.geojson","name":"Trinidad Tobago"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-75.582,6.2535]},"properties":{"file":"medellin_colombia.geojson","name":"Medellin, Colombia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-84.081,9.8975]},"properties":{"file":"san-jose_costa-rica.geojson","name":"San Jose, Costa Rica"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-47.9395,-15.8385]},"properties":{"file":"brasilia_brazil.geojson","name":"Brasilia, Brazil"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[29.992,31.228]},"properties":{"file":"alexandria_egypt.geojson","name":"Alexandria, Egypt"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[6.6475,36.354]},"properties":{"file":"constantine_algeria.geojson","name":"Constantine, Algeria"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[28.0395,-26.1985]},"properties":{"file":"johannesburg_south-africa.geojson","name":"Johannesburg, South Africa"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-7.5965,33.5695]},"properties":{"file":"casablanca_morocco.geojson","name":"Casablanca, Morocco"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.016,5.3715]},"properties":{"file":"abidjan_ivory-coast.geojson","name":"Abidjan, Ivory Coast"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[1.2375,6.1905]},"properties":{"file":"lome_togo.geojson","name":"Lome, Togo"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[39.2775,-6.811]},"properties":{"file":"dar-es-salaam_tanzania.geojson","name":"Dar Es Salaam, Tanzania"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-17.3755,14.752]},"properties":{"file":"dakar_senegal.geojson","name":"Dakar, Senegal"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-13.659,9.614]},"properties":{"file":"conakry_guinea.geojson","name":"Conakry, Guinea"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[18.5605,4.389]},"properties":{"file":"bangui_central-african-republic.geojson","name":"Bangui, Central African Republic"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[10.2355,36.8335]},"properties":{"file":"tunis_tunisia.geojson","name":"Tunis, Tunisia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[31.3035,30.1625]},"properties":{"file":"cairo_egypt.geojson","name":"Cairo, Egypt"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[13.293,-8.909]},"properties":{"file":"luanda_angola.geojson","name":"Luanda, Angola"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[18.653,-33.917]},"properties":{"file":"cape-town_south-africa.geojson","name":"Cape Town, South Africa"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[47.5245,-18.8985]},"properties":{"file":"antananarivo_madagascar.geojson","name":"Antananarivo, Madagascar"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[38.7855,8.998]},"properties":{"file":"addis-abeba_ethiopia.geojson","name":"Addis Abeba, Ethiopia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[15.323,-4.401]},"properties":{"file":"kinshasa_congo.geojson","name":"Kinshasa, Congo"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[30.9195,-29.9025]},"properties":{"file":"durban_south-africa.geojson","name":"Durban, South Africa"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[3.3615,6.615]},"properties":{"file":"lagos_nigeria.geojson","name":"Lagos, Nigeria"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[31.572,4.857]},"properties":{"file":"juba_south-sudan.geojson","name":"Juba, South Sudan"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[7.744,36.918]},"properties":{"file":"annaba_algeria.geojson","name":"Annaba, Algeria"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[3.042,36.753]},"properties":{"file":"algiers_algeria.geojson","name":"Algiers, Algeria"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[8.5265,12.0005]},"properties":{"file":"kano_nigeria.geojson","name":"Kano, Nigeria"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.8405,9.418]},"properties":{"file":"tamale_ghana.geojson","name":"Tamale, Ghana"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[32.5485,-25.9275]},"properties":{"file":"maputo_mozambique.geojson","name":"Maputo, Mozambique"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[36.819,-1.2265]},"properties":{"file":"nairobi_kenya.geojson","name":"Nairobi, Kenya"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[2.1065,13.5045]},"properties":{"file":"niamey_niger.geojson","name":"Niamey, Niger"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[31.039,-17.8345]},"properties":{"file":"harare_zimbabwe.geojson","name":"Harare, Zimbabwe"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.543,12.3725]},"properties":{"file":"ouagadougou_burkina-faso.geojson","name":"Ouagadougou, Burkina Faso"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[32.5765,0.2595]},"properties":{"file":"kampala_uganda.geojson","name":"Kampala, Uganda"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[30.099,-1.912]},"properties":{"file":"kigali_rwanda.geojson","name":"Kigali, Rwanda"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[28.296,-15.409]},"properties":{"file":"lusaka_zambia.geojson","name":"Lusaka, Zambia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[33.779,-13.976]},"properties":{"file":"lilongwe_malawi.geojson","name":"Lilongwe, Malawi"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[32.532,15.617]},"properties":{"file":"khartoum_republic-of-sudan.geojson","name":"Khartoum, Republic Of Sudan"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.254,5.575]},"properties":{"file":"accra_ghana.geojson","name":"Accra, Ghana"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-10.7285,6.3145]},"properties":{"file":"monrovia_liberia.geojson","name":"Monrovia, Liberia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[45.3305,2.0515]},"properties":{"file":"mogadishu_somalia.geojson","name":"Mogadishu, Somalia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-8.008,12.613]},"properties":{"file":"bamako_mali.geojson","name":"Bamako, Mali"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[29.355,-3.375]},"properties":{"file":"bujumbura_burundi.geojson","name":"Bujumbura, Burundi"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[57.5455,-20.1885]},"properties":{"file":"mauritius.geojson","name":"Mauritius"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[25.9055,-24.608]},"properties":{"file":"gaborone_botswana.geojson","name":"Gaborone, Botswana"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[2.425,6.37]},"properties":{"file":"cotonou_benin.geojson","name":"Cotonou, Benin"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.6415,35.7075]},"properties":{"file":"oran_algeria.geojson","name":"Oran, Algeria"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[7.4825,9.0405]},"properties":{"file":"abuja_nigeria.geojson","name":"Abuja, Nigeria"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[141.248,42.985]},"properties":{"file":"sapporo_japan.geojson","name":"Sapporo, Japan"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[126.557,33.3425]},"properties":{"file":"jeju_south-korea.geojson","name":"Jeju, South Korea"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[68.689,38.5365]},"properties":{"file":"dushanbe_tajikistan.geojson","name":"Dushanbe, Tajikistan"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[80.0705,6.9865]},"properties":{"file":"colombo_sri-lanka.geojson","name":"Colombo, Sri Lanka"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[100.0035,9.5035]},"properties":{"file":"koh-samui_thailand.geojson","name":"Koh Samui, Thailand"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[100.453,13.84]},"properties":{"file":"bangkok_thailand.geojson","name":"Bangkok, Thailand"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[39.863,43.5135]},"properties":{"file":"sochi_russia.geojson","name":"Sochi, Russia"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[128.8475,35.215]},"properties":{"file":"busan_south-korea.geojson","name":"Busan, South Korea"}}]}|
      return bunch_of_points
    else
      return response.body
    end
  end

  def self.get_random_address
    print_debug_start("to get the address")

    uri = build_uri('/api/randomMadrid')
    http = build_http_object(uri)
    request = Net::HTTP::Get.new(uri)

    response = http.request(request)

    puts "Address: #{JSON.parse(response.body)['display_name']}"
    print_debug_end(response.code)

    return JSON.parse(response.body)['display_name']
  end

  def self.register_location
    print_debug_start("to register a vote")

    uri = build_uri('/api/test')
    http = build_http_object(uri)
    request = Net::HTTP::Post.new(uri)
    request.basic_auth(api_key, api_secret)

    response = http.request(request)

    print_debug_end(response.code)
  end

  def self.register_random_location(group_id, user_id)
    print_debug_start("to register a vote with a random address")

    uri = build_uri('/api/locationgroup/' + group_id)
    http = build_http_object(uri)
    request = Net::HTTP::Post.new(uri)
    request.basic_auth(api_key, api_secret)
    request.set_form_data('usr_id': user_id, 'address': get_random_address)

    response = http.request(request)

    print_debug_end(response.code)
  end

  def self.get_locations(id)
    print_debug_start("to get the locations JSON")

    uri = build_uri('/api/locationgroup/' + id)
    http = build_http_object(uri)
    request = Net::HTTP::Get.new(uri)
    request.basic_auth(api_key, api_secret)

    response = http.request(request)

    puts "Response body: #{response.body}"
    print_debug_end(response.code)

    return response.body
  end

  def self.get_barrios(id)
    print_debug_start("to get the barrios JSON")

    uri = build_uri('/api/locationgroup/' + id + '/totals/madrid_barrios')
    http = build_http_object(uri)
    puts "#{uri}"
    request = Net::HTTP::Get.new(uri)
    request.basic_auth(api_key, api_secret)

    response = http.request(request)

    ## puts "Response body: #{response.body}"
    print_debug_end(response.code)

    return response.body
  end

  def self.get_distritos(id)
    print_debug_start("to get the distritos JSON")

    uri = build_uri('/api/locationgroup/' + id + '/totals/madrid_distritos')
    http = build_http_object(uri)
    puts "#{uri}"
    request = Net::HTTP::Get.new(uri)
    request.basic_auth(api_key, api_secret)

    response = http.request(request)

    ## puts "Response body: #{response.body}"
    print_debug_end(response.code)

    return response.body
  end

  def self.create_location_group(id, title)
    print_debug_start("to create a new proposal")

    uri = build_uri('/api/locationgroup')
    http = build_http_object(uri)
    request = Net::HTTP::Post.new(uri)
    request.basic_auth(api_key, api_secret)
    request.set_form_data('id': id, 'title': title)

    response = http.request(request)

    print_debug_end(response.code)
  end

  private

    # Example: '/api/survey/50ibWU/totals/countries'
    def self.build_uri(path)
      URI::HTTP.build(host: api_host, path: path, port: api_port)
    end

    def self.build_http_object(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http
    end

    def self.print_debug_start(description = "")
      puts "\n\n\n" + "-"*60
      puts "Sending request to EMAPIC API " + description
    end

    def self.print_debug_end(http_code)
      puts "Response code: #{http_code}"
      puts "-"*60 + "\n\n\n"
    end

    def self.api_host
      Rails.application.secrets.emapic_api_host
    end

    def self.api_port
      Rails.application.secrets.emapic_api_port
    end

    def self.api_key
      Rails.application.secrets.emapic_api_key
    end

    def self.api_secret
      Rails.application.secrets.emapic_api_secret
    end
end
