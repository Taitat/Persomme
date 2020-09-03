class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '----'},
    { id: 2, name: '経済'},
    { id: 3, name: '政治'},
    { id: 4, name: '健康'},
    { id: 5, name: 'スポーツ'},
    { id: 6, name: '国際'},
    { id: 7, name: 'IT'},
    { id: 8, name: 'ビジネス'},
    { id: 9, name: '芸術'},
    { id: 10, name: 'グルメ'},
    { id: 11, name: '心理'},
    { id: 12, name: '生活'},
    { id: 13, name: '恋愛'},
    { id: 14, name: 'お金'},
    { id: 15, name: '人間関係'},
    { id: 16, name: 'ファッション'},
    { id: 17, name: '学問'},
    { id: 18, name: 'ノージャンル'}
  ]
end
