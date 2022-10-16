import { get } from '../../utils/ApiCaller'

const useMyRecipe = () => {
    const getRecipes = (userId, params, pageNum = 1) =>
        get({
            endpoint: `/api/user/${userId}/post/page/${pageNum}${params}`,
        })

    return {
        getRecipes,
    }
}
export default useMyRecipe
