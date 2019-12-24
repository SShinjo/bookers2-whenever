class Search < ApplicationRecord
	 enum model: {User: 1, Book: 2}

	 enum option: {完全一致: 1, 前方一致: 2, 後方一致: 3, 部分一致: 4}

end
