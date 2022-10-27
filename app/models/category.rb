class category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ドライバー' },
    { id: 3, name: 'フェアウェイウッド' },
    { id: 4, name: 'ユーティリティー' },
    { id: 5, name: 'アイアン' },
    { id: 6, name: 'ウェッジ' },
    { id: 7, name: 'パター' },
    { id: 8, name: 'アパレル' },
    { id: 9, name: 'アクセサリー' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
  
  end