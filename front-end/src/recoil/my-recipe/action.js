import { get } from '../../utils/ApiCaller'

const useMyRecipe = () => {
    const getRecipes = (search, userid, pageNum, type) =>
        get({
            endpoint: `/api/user/${userid}/post/page/${pageNum}`,
            params: {
                pageNumber: pageNum,
                Name: search,
                Type: type,
                PageSize: 6,
            },
        })

    return {
        getRecipes,
    }
}
export default useMyRecipe
