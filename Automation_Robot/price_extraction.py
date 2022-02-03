from robot.api.deco import keyword


@keyword("Price Extraction")
def  extract_price(l1):
    l2 = []
    for items in l1:
        start = str(items).find("$")
        end = str(items).find(".00")
        l2.append(str(items)[start+1:end])
    return l2



