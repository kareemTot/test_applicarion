const String getStoreData = '''
  query Products(\$first: Int, \$after: String) {
    categories(storeId: "alkhbaz", first: \$first, after: \$after ,sort: "name:asc", cultureName: "en-Us"
        currencyCode: "USD") {
      items {
        id
        imgSrc
        code
        name
        level
        priority
        outline
        slug
        path
        hasParent
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
