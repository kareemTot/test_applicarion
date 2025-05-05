const String productQl = '''
query Products(\$first: Int, \$after: String , \$filter: String) {
    products(storeId: "alkhbaz" ,first: \$first, after: \$after , filter: \$filter, cultureName: "en-Us"
        currencyCode: "USD") {
       items {
            id
            code
            catalogId
            productType
            minQuantity
            maxQuantity
            outline
            slug
            name
            imgSrc
            outerId
            brandName
            hasVariations
            inWishlist
               images {
                id
                name
                group
                url
                relativeUrl
                sortOrder
                cultureName
            }
        }
        totalCount
        pageInfo {
            hasNextPage
            endCursor
        }
    }
  
}

''';
