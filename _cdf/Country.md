---
---

## Country {#Country}

A country in which a particular offer (subscription, free, purchase, or rental) is available. Each offer can contain as many Country elements as needed.

**Required:**

| Added | CDF version 1.0 |
| Parent Elements | [Regions](#Regions) |
| Child Elements | None |
| Attributes | None |
| Accepted values | The following subset of [ISO 3166-1 country codes](http://www.iso.org/iso/country_codes.htm): AF AX AL DZ AS AD AO AI AQ AG AR AM AW AU AT AZ BS BH BD BB BY BE BZ BJ BM BT BO BQ BA BW BV BR IO BN BG BF BI KH CM CA CV KY CF TD CL CN CX CC CO KM CG CD CK CR CI HR CU CW CY CZ DK DJ DM DO EC EG SV GQ ER EE ET FK FO FJ FI FR GF PF TF GA GM GE DE GH GI GR GL GD GP GU GT GG GN GW GY HT HM VA HN HK HU IS IN ID IR IQ IE IM IL IT JM JP JE JO KZ KE KI KP KR KW KG LA LV LB LS LR LY LI LT LU MO MK MG MW MY MV ML MT MH MQ MR MU YT MX FM MD MC MN ME MS MA MZ MM NA NR NP NL NC NZ NI NE NG NU NF MP NO OM PK PW PS PA PG PY PE PH PN PL PT PR QA RE RO RU RW BL SH KN LC MF PM VC WS SM ST SA SN RS SC SL SG SX SK SI SB SO ZA GS SS ES LK SD SR SJ SZ SE CH SY TW TJ TZ TH TL TG TK TO TT TN TR TM TC TV UG UA AE GB US UM UY UZ VU VE VN VG VI WF EH YE ZM ZW |

**Example:**

```xml
<SubscriptionOffer>
  <Regions>
    <Country>US</Country>
    <Country>CA</Country>
  </Regions>
  ...
</SubscriptionOffer>
```
