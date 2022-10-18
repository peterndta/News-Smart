import React, { lazy, Suspense } from 'react'

import { Redirect, Route, Switch } from 'react-router-dom'

import { AdminLayout, CommonLayout } from '../components/Layout'

import LoadingPage from '../pages/Loading'
import HybridRoute from './HybridRoute'
import PrivateRoute from './PrivateRoute'
import PublicRoute from './PublicRoute'

const publicRoutes = [
    {
        path: '/login',
        name: 'login',
        component: lazy(() => import('../pages/Login')),
    },
]

const hybridRoutes = [
    {
        path: '/recipes',
        name: 'recipes',
        component: lazy(() => import('../pages/Recipes')),
        layout: 'common',
    },
    {
        path: '/',
        name: 'home',
        component: lazy(() => import('../pages/Home')),
        layout: 'common',
    },
    {
        path: '/recipes/collection',
        name: 'course',
        component: lazy(() => import('../pages/Course')),
        layout: 'common',
    },
    {
        path: '/recipes/category',
        name: 'categories',
        component: lazy(() => import('../pages/Categories')),
        layout: 'common',
    },
    {
        path: '/recipes/method',
        name: 'methods',
        component: lazy(() => import('../pages/Methods')),
        layout: 'common',
    },
]

const privateRoutes = [
    {
        path: '/recipes/bookmark',
        name: 'bookmark',
        component: lazy(() => import('../pages/Bookmark')),
        layout: 'common',
        role: 'user',
    },
    {
        path: '/recipes/my-ratings',
        name: 'rating recipes',
        component: lazy(() => import('../pages/Rating')),
        layout: 'common',
        role: 'user',
    },
    {
        path: '/profile',
        name: 'my profile',
        component: lazy(() => import('../pages/Profile')),
        layout: 'common',
        role: 'user',
    },
    {
        path: '/recipes/me',
        name: 'my Recipes',
        component: lazy(() => import('../pages/MyRecipes')),
        layout: 'common',
        role: 'user',
    },
    {
        path: '/recipes/create',
        name: 'create recipe',
        component: lazy(() => import('../pages/CreateRecipe')),
        layout: 'common',
        role: 'user',
    },
    {
        path: '/recipes/:id',
        name: 'recipe detail',
        component: lazy(() => import('../pages/RecipeDetail')),
        layout: 'common',
    },
    {
        path: '/admin/users',
        name: 'users management',
        component: lazy(() => import('../pages/Admin/UserManagement')),
        layout: 'admin',
        role: 'admin',
    },
    {
        path: '/admin/users/:id',
        name: 'user details',
        component: lazy(() => import('../pages/Admin/AdminViewProfile')),
        layout: 'admin',
        role: 'admin',
    },
    {
        path: '/admin/posts-management',
        name: 'posts management',
        component: lazy(() => import('../pages/Admin/PostManagement')),
        layout: 'admin',
        role: 'admin',
    },
    {
        path: '/admin/posts-management/:id',
        name: 'posts management',
        component: lazy(() => import('../pages/Admin/PostDetail')),
        layout: 'admin',
        role: 'admin',
    },
    {
        path: '/admin/reports',
        name: 'reports',
        component: lazy(() => import('../pages/Admin/Reports')),
        layout: 'admin',
        role: 'admin',
    },
    {
        path: '/admin/collection',
        name: 'collection',
        component: lazy(() => import('../pages/Admin/AdminCollection')),
        layout: 'admin',
        role: 'admin',
    },
]

const Routes = (
    <Suspense fallback={<LoadingPage />}>
        <Switch>
            {publicRoutes.map(
                ({ layout, ...route }) =>
                    !layout && <PublicRoute key={route.name} exact={true} {...route} />
            )}
            {hybridRoutes.map(
                ({ layout, ...route }) =>
                    !layout && <HybridRoute key={route.name} exact={true} {...route} />
            )}
            {privateRoutes.map(
                ({ layout, ...route }) =>
                    !layout && <PrivateRoute key={route.name} exact={true} {...route} />
            )}
            <Route path="/admin">
                <AdminLayout>
                    <Suspense fallback={<LoadingPage />}>
                        <Switch>
                            {publicRoutes.map(
                                ({ layout, ...route }) =>
                                    layout === 'admin' && (
                                        <PublicRoute key={route.name} exact={true} {...route} />
                                    )
                            )}
                            {hybridRoutes.map(
                                ({ layout, ...route }) =>
                                    layout === 'admin' && (
                                        <HybridRoute key={route.name} exact={true} {...route} />
                                    )
                            )}
                            {privateRoutes.map(
                                ({ layout, ...route }) =>
                                    layout === 'admin' && (
                                        <PrivateRoute key={route.name} exact={true} {...route} />
                                    )
                            )}
                            <Redirect to="/admin" />
                        </Switch>
                    </Suspense>
                </AdminLayout>
            </Route>
            <Route>
                <CommonLayout>
                    <Suspense fallback={<LoadingPage />}>
                        <Switch>
                            {publicRoutes.map(
                                ({ layout, ...route }) =>
                                    layout === 'common' && (
                                        <PublicRoute key={route.name} exact={true} {...route} />
                                    )
                            )}
                            {hybridRoutes.map(
                                ({ layout, ...route }) =>
                                    layout === 'common' && (
                                        <HybridRoute key={route.name} exact={true} {...route} />
                                    )
                            )}
                            {privateRoutes.map(
                                ({ layout, ...route }) =>
                                    layout === 'common' && (
                                        <PrivateRoute key={route.name} exact={true} {...route} />
                                    )
                            )}
                            <Redirect to="/" />
                        </Switch>
                    </Suspense>
                </CommonLayout>
            </Route>
        </Switch>
    </Suspense>
)

export default Routes
