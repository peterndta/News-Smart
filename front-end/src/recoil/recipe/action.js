import { get } from '../../utils/ApiCaller'

const useRecipe = () => {
    const getRecipe = (id) =>
        get({
            endpoint: `api/post/${id}`,
        })

    return {
        getRecipe,
    }
}
export default useRecipe
