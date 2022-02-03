from robot.api.deco import keyword


def multiply(n1,n2):
    return (n1)*(n2)

@keyword("My Custom Keyword")
def subtract(n1,n2):
    if n1>n2:
        return n1-n2
    else:
        return n2-n1
