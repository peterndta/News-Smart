import React, { useEffect, useState } from 'react'

import ReactPlayer from 'react-player/youtube'

import { CameraAlt } from '@mui/icons-material'
import {
    Box,
    Button,
    Chip,
    Container,
    Divider,
    FormControl,
    FormHelperText,
    Grid,
    InputLabel,
    OutlinedInput,
    Paper,
    TextField,
    Typography,
} from '@mui/material'
import { blueGrey, grey } from '@mui/material/colors'

import defaultPost from '../../../assets/images/defaultPoster.png'
import usePrompt from '../../../hooks/use-prompt'
import SelectCategories from './SelectCategories'
import SelectContinents from './SelectContinents'
import SelectMethods from './SelectMethods'
import SelectUses from './SelectUses'

const isEmpty = (incomeValue) => incomeValue.trim().length === 0
const defaultTextFieldValue = { value: '', isTouched: false }
const youtubeUrlPattern = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=|\?v=)([^#\&\?]*).*/
const min = 1
const max = 120

const CreateRecipeForm = ({ createRecipeHandler }) => {
    const [poster, setPoster] = useState({ src: defaultPost, file: null })
    const [youtubeUrl, setYoutubeUrl] = useState({ ...defaultTextFieldValue, isValid: false })
    const [categories, setCategories] = useState([])
    const [method, setMethod] = useState('')
    const [uses, setUses] = useState('')
    const [continents, setContinents] = useState('')
    const [name, setName] = useState(defaultTextFieldValue)
    const [description, setDescription] = useState(defaultTextFieldValue)
    const [toolsPreparation, setToolsPreparation] = useState(defaultTextFieldValue)
    const [ingredientsPreparation, setIngredientsPreparation] = useState(defaultTextFieldValue)
    const [process, setProcess] = useState(defaultTextFieldValue)
    const [cook, setCook] = useState(defaultTextFieldValue)
    const { routerPrompt, setFormIsTouched } = usePrompt('Changes you made may not be saved.')
    const [servingPeople, setServingPeople] = useState(1)
    const [preparingTime, setPreparingTime] = useState(1)
    const [processingTime, setProcessingTime] = useState(1)
    const [cookingTime, setCookingTime] = useState(1)

    const dishNameChangeHandler = (event) => {
        setName((previousValue) => ({ ...previousValue, value: event.target.value }))
    }

    const dishNameTouchedHandler = () => {
        setName((previousValue) => ({ ...previousValue, isTouched: true }))
    }

    const descriptionChangeHandler = (event) => {
        setDescription((previousValue) => ({ ...previousValue, value: event.target.value }))
    }

    const descriptionTouchedHandler = () => {
        setDescription((previousValue) => ({ ...previousValue, isTouched: true }))
    }

    const toolsChangeHandler = (event) => {
        setToolsPreparation((previousValue) => ({ ...previousValue, value: event.target.value }))
    }

    const toolsTouchHandler = () => {
        setToolsPreparation((previousValue) => ({ ...previousValue, isTouched: true }))
    }

    const ingredientsChangeHandler = (event) => {
        setIngredientsPreparation((previousValue) => ({
            ...previousValue,
            value: event.target.value,
        }))
    }

    const ingredientsTouchHandler = () => {
        setIngredientsPreparation((previousValue) => ({ ...previousValue, isTouched: true }))
    }

    const processChangeHandler = (event) => {
        setProcess((previousValue) => ({
            ...previousValue,
            value: event.target.value,
        }))
    }

    const processTouchHandler = () => {
        setProcess((previousValue) => ({ ...previousValue, isTouched: true }))
    }

    const cookChangeHandler = (event) => {
        setCook((previousValue) => ({
            ...previousValue,
            value: event.target.value,
        }))
    }

    const cookTouchHandler = () => {
        setCook((previousValue) => ({ ...previousValue, isTouched: true }))
    }

    const formIsEntering = () => {
        setFormIsTouched(true)
    }

    const finishFormEntering = () => {
        setFormIsTouched(false)
    }

    useEffect(() => {
        return () => {
            poster.src && URL.revokeObjectURL(poster.src)
        }
    }, [poster])

    const submitHandler = (event) => {
        event.preventDefault()
        const categoriesId = categories.map((cate) => cate.id)
        const recipeInfo = {
            name: name.value,
            cookingMethodId: method,
            recipeRegionId: continents,
            videoUrl: youtubeUrl.value,
            usesId: uses,
            categoriesId: categoriesId,
            description: description.value,
            ingredient: ingredientsPreparation.value,
            tool: toolsPreparation.value,
            processing: process.value,
            cooking: cook.value,
            processingTime: +processingTime,
            cookingTime: +cookingTime,
            preparingTime: +preparingTime,
            serving: +servingPeople,
        }

        createRecipeHandler(poster, recipeInfo)
    }

    const uploadImageHandler = (event) => {
        const file = event.target.files[0]
        if (!file) return

        const { type } = file
        if (!(type.endsWith('jpeg') || !type.endsWith('png') || !type.endsWith('jpg'))) {
            showSnackbar({
                severity: 'error',
                children: 'Event poster can only be jpeg, png and jpg file.',
            })
            return
        }

        const imageUrl = URL.createObjectURL(event.target.files[0])
        setPoster({ src: imageUrl, file })
    }

    const urlVideoToucheHandler = () => {
        setYoutubeUrl((previousValue) => ({ ...previousValue, isTouched: true }))
    }

    const urlVideoChangeHandler = (event) => {
        if (event.target.value.match(youtubeUrlPattern)) {
            setYoutubeUrl((previousValue) => ({
                ...previousValue,
                value: event.target.value,
                isValid: true,
            }))
        } else {
            setYoutubeUrl((previousValue) => ({
                ...previousValue,
                value: event.target.value,
                isValid: false,
            }))
        }
    }

    const dishNameIsInValid = isEmpty(name.value) && name.isTouched
    const descriptionIsInValid = isEmpty(description.value) && description.isTouched
    const toolsIsInvalid = isEmpty(toolsPreparation.value) && toolsPreparation.isTouched
    const ingredientsIsInvalid =
        isEmpty(ingredientsPreparation.value) && ingredientsPreparation.isTouched
    const processIsInvalid = isEmpty(process.value) && process.isTouched
    const cookIsInvalid = isEmpty(cook.value) && cook.isTouched
    const youtubeUrlIsInvalid = isEmpty(youtubeUrl.value) && youtubeUrl.isTouched
    const overallTextFieldIsValid =
        !isEmpty(name.value) &&
        !isEmpty(description.value) &&
        !isEmpty(toolsPreparation.value) &&
        !isEmpty(ingredientsPreparation.value) &&
        !isEmpty(process.value) &&
        !isEmpty(cook.value) &&
        !isEmpty(youtubeUrl.value)

    return (
        <Container maxWidth="xl" sx={{ mt: 3 }}>
            <Grid container component={Paper} elevation={3}>
                {routerPrompt}
                <Box
                    component="form"
                    autoComplete="off"
                    onSubmit={submitHandler}
                    width="1"
                    onChange={formIsEntering}
                >
                    <Grid md={12} item container>
                        <Grid item md={4} height={470}>
                            <Box height="100%" pl={4} pt={4}>
                                <Box
                                    component="img"
                                    alt="school-image"
                                    src={poster.src}
                                    sx={{
                                        width: '100%',
                                        aspectRatio: '1 / 1',
                                        objectFit: 'cover',
                                    }}
                                />
                                <Box
                                    sx={{
                                        mt: 3,
                                        mb: 2,
                                        width: '100%',
                                        display: 'flex',
                                        flexDirection: 'column',
                                        alignItems: 'center',
                                    }}
                                >
                                    <InputLabel
                                        htmlFor="upload-photo"
                                        sx={{ display: 'inline-block' }}
                                    >
                                        <input
                                            required
                                            style={{ opacity: 0, maxWidth: 0.5 }}
                                            id="upload-photo"
                                            type="file"
                                            onChange={uploadImageHandler}
                                            accept="image/*"
                                        />
                                        <Button
                                            variant="outlined"
                                            component="span"
                                            startIcon={<CameraAlt />}
                                        >
                                            Upload Poster
                                        </Button>
                                    </InputLabel>
                                </Box>
                            </Box>
                        </Grid>
                        <Grid item md={8} height={470}>
                            <Box p={4}>
                                <FormControl fullWidth required>
                                    <InputLabel htmlFor="component-outlined">
                                        Name of dish
                                    </InputLabel>
                                    <OutlinedInput
                                        id="component-outlined"
                                        label="Name of dish"
                                        value={name.value}
                                        onBlur={dishNameTouchedHandler}
                                        onChange={dishNameChangeHandler}
                                        error={dishNameIsInValid}
                                    />
                                    {dishNameIsInValid && (
                                        <FormHelperText error={dishNameIsInValid}>
                                            Dish name must not be empty
                                        </FormHelperText>
                                    )}
                                </FormControl>
                                <FormControl
                                    fullWidth
                                    required
                                    sx={{ mt: dishNameIsInValid ? 2 : 5 }}
                                >
                                    <InputLabel htmlFor="component-outlined">
                                        Description
                                    </InputLabel>
                                    <OutlinedInput
                                        id="component-outlined"
                                        label="Description"
                                        minRows={9}
                                        multiline
                                        onChange={descriptionChangeHandler}
                                        onBlur={descriptionTouchedHandler}
                                        error={descriptionIsInValid}
                                    />
                                    {descriptionIsInValid && (
                                        <FormHelperText error={descriptionIsInValid}>
                                            description must not be empty
                                        </FormHelperText>
                                    )}
                                </FormControl>
                                <Box display="flex" mt={3} justifyContent="flex-end">
                                    <SelectCategories
                                        categories={categories}
                                        setCategories={setCategories}
                                    />
                                    <SelectMethods method={method} setMethod={setMethod} />
                                    <SelectUses uses={uses} setUses={setUses} />
                                    <SelectContinents
                                        continents={continents}
                                        setContinents={setContinents}
                                    />
                                </Box>
                            </Box>
                        </Grid>
                    </Grid>
                    <Divider
                        sx={{
                            backgroundColor: blueGrey[800],
                            width: '100%',
                            opacity: 0.5,
                        }}
                        light
                    />
                    <Grid item md={12} container>
                        <Box p={4} width="1">
                            <Box>
                                <Typography
                                    variant="h4"
                                    fontWeight={700}
                                    sx={{ color: blueGrey[600], mb: 1 }}
                                >
                                    Directions
                                </Typography>
                            </Box>
                            <Chip label="Step 1: Preparation" color="primary" variant="outlined" />
                            <Grid container item my={3} columnSpacing={5}>
                                <Grid item md={6}>
                                    <FormControl fullWidth required>
                                        <InputLabel htmlFor="component-outlined">
                                            Tools needed
                                        </InputLabel>
                                        <OutlinedInput
                                            id="component-outlined"
                                            label="Tools needed"
                                            minRows={5}
                                            maxRows={5}
                                            multiline
                                            value={toolsPreparation.value}
                                            onBlur={toolsTouchHandler}
                                            onChange={toolsChangeHandler}
                                            error={toolsIsInvalid}
                                        />
                                    </FormControl>
                                    {toolsIsInvalid && (
                                        <FormHelperText error={toolsIsInvalid}>
                                            Tools preparation must not be empty
                                        </FormHelperText>
                                    )}
                                </Grid>
                                <Grid item md={6}>
                                    <FormControl fullWidth required>
                                        <InputLabel htmlFor="component-outlined">
                                            Ingredients needed
                                        </InputLabel>
                                        <OutlinedInput
                                            id="component-outlined"
                                            label="Ingredients needed"
                                            minRows={5}
                                            maxRows={5}
                                            multiline
                                            value={ingredientsPreparation.value}
                                            onBlur={ingredientsTouchHandler}
                                            onChange={ingredientsChangeHandler}
                                            error={ingredientsIsInvalid}
                                        />
                                        {ingredientsIsInvalid && (
                                            <FormHelperText error={ingredientsIsInvalid}>
                                                Ingredients preparation must not be empty
                                            </FormHelperText>
                                        )}
                                    </FormControl>
                                </Grid>
                            </Grid>
                            <Chip label="Step 2: Process" color="primary" variant="outlined" />
                            <TextField
                                minRows={5}
                                maxRows={5}
                                multiline
                                placeholder="e.g. Combine all dry ingredients in a large bowl…"
                                sx={{ width: '100%', my: 3 }}
                                required
                                onBlur={processTouchHandler}
                                onChange={processChangeHandler}
                                helperText={processIsInvalid ? 'Process must not be empty' : ''}
                                error={processIsInvalid}
                            />
                            <Chip label="Step 3: Cooking" color="primary" variant="outlined" />
                            <TextField
                                minRows={5}
                                maxRows={5}
                                multiline
                                placeholder="e.g. Preheat oven to 350 degrees F…"
                                sx={{ width: '100%', my: 3 }}
                                required
                                onBlur={cookTouchHandler}
                                onChange={cookChangeHandler}
                                helperText={cookIsInvalid ? 'Process must not be empty' : ''}
                                error={cookIsInvalid}
                            />
                            <Box display="flex" justifyContent="space-between" mt={3}>
                                <FormControl required mt={3} size="small" sx={{ width: '36%' }}>
                                    <InputLabel htmlFor="component-outlined">
                                        Youtube Url
                                    </InputLabel>
                                    <OutlinedInput
                                        id="component-outlined"
                                        label="Youtube Url"
                                        value={youtubeUrl.value}
                                        onBlur={urlVideoToucheHandler}
                                        onChange={urlVideoChangeHandler}
                                        error={youtubeUrlIsInvalid}
                                    />
                                </FormControl>
                            </Box>
                            {youtubeUrlIsInvalid && (
                                <FormHelperText error={youtubeUrlIsInvalid}>
                                    Youtube Url must not be empty
                                </FormHelperText>
                            )}
                            <Box display="flex" sx={{ mt: 3 }}>
                                <Box display="flex" width="1">
                                    {youtubeUrl.isValid ? (
                                        <ReactPlayer
                                            url={youtubeUrl.value}
                                            height={240}
                                            width={500}
                                            controls={true}
                                        />
                                    ) : (
                                        <Box
                                            display="flex"
                                            alignItems="center"
                                            justifyContent="center"
                                            height={240}
                                            width={500}
                                            sx={{ border: `0.5px solid ${grey[300]}` }}
                                        >
                                            <Typography variant="h6">
                                                Youtube Url is invalid, please input again
                                            </Typography>
                                        </Box>
                                    )}
                                    <Box ml={5} width="0.5">
                                        <FormControl required fullWidth size="small">
                                            <InputLabel htmlFor="component-outlined">
                                                Serving
                                            </InputLabel>
                                            <OutlinedInput
                                                id="component-outlined"
                                                label="Serving"
                                                inputProps={{
                                                    type: 'number',
                                                    inputMode: 'numeric',
                                                    pattern: '[0-9]*',
                                                    min: 1,
                                                    max: 10,
                                                }}
                                                value={servingPeople}
                                                onChange={(event) =>
                                                    setServingPeople(event.target.value)
                                                }
                                                sx={{
                                                    'input::-webkit-outer-spin-button, input::-webkit-inner-spin-button':
                                                        { display: 'none' },
                                                }}
                                                placeholder="E.g 6"
                                            />
                                        </FormControl>
                                        <FormControl required sx={{ mt: 3 }} fullWidth size="small">
                                            <InputLabel htmlFor="prepare">Preparing</InputLabel>
                                            <OutlinedInput
                                                id="prepare"
                                                label="Preparing"
                                                inputProps={{
                                                    type: 'number',
                                                    inputMode: 'numeric',
                                                    pattern: '[0-9]*',
                                                    min: min,
                                                    max: max,
                                                }}
                                                value={preparingTime}
                                                onChange={(event) =>
                                                    setPreparingTime(event.target.value)
                                                }
                                                sx={{
                                                    'input::-webkit-outer-spin-button, input::-webkit-inner-spin-button':
                                                        { display: 'none' },
                                                }}
                                                placeholder="E.g 6 minutes"
                                            />
                                        </FormControl>
                                        <FormControl required sx={{ mt: 3 }} fullWidth size="small">
                                            <InputLabel htmlFor="processing">Processing</InputLabel>
                                            <OutlinedInput
                                                id="processing"
                                                label="Processing"
                                                inputProps={{
                                                    type: 'number',
                                                    inputMode: 'numeric',
                                                    pattern: '[0-9]*',
                                                    min: min,
                                                    max: max,
                                                }}
                                                value={processingTime}
                                                onChange={(event) =>
                                                    setProcessingTime(event.target.value)
                                                }
                                                sx={{
                                                    'input::-webkit-outer-spin-button, input::-webkit-inner-spin-button':
                                                        { display: 'none' },
                                                }}
                                                placeholder="E.g 6 minutes"
                                            />
                                        </FormControl>
                                        <FormControl required sx={{ mt: 3 }} fullWidth size="small">
                                            <InputLabel htmlFor="cook">Cooking</InputLabel>
                                            <OutlinedInput
                                                id="cook"
                                                label="Cooking"
                                                inputProps={{
                                                    type: 'number',
                                                    inputMode: 'numeric',
                                                    pattern: '[0-9]*',
                                                    min: 1,
                                                    max: 180,
                                                }}
                                                value={cookingTime}
                                                onChange={(event) =>
                                                    setCookingTime(event.target.value)
                                                }
                                                sx={{
                                                    'input::-webkit-outer-spin-button, input::-webkit-inner-spin-button':
                                                        { display: 'none' },
                                                }}
                                                placeholder="E.g 6 minutes"
                                            />
                                        </FormControl>
                                    </Box>
                                </Box>
                            </Box>
                            <Box sx={{ mt: 5 }} display="flex" justifyContent="flex-end">
                                <Button
                                    variant="contained"
                                    type="submit"
                                    sx={{ color: grey[100] }}
                                    disabled={!overallTextFieldIsValid}
                                    onClick={finishFormEntering}
                                >
                                    Submit
                                </Button>
                            </Box>
                        </Box>
                    </Grid>
                </Box>
            </Grid>
        </Container>
    )
}

export default CreateRecipeForm
