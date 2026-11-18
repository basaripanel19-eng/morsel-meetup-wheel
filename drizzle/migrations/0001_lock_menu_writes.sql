DROP POLICY IF EXISTS "Passwordless menu item management" ON public.menu_items;
DROP POLICY IF EXISTS "Passwordless menu category management" ON public.menu_categories;
REVOKE INSERT, UPDATE, DELETE ON public.menu_items, public.menu_categories FROM anon, authenticated;
GRANT SELECT ON public.menu_items, public.menu_categories TO anon, authenticated;
CREATE POLICY "Public can view available menu items" ON public.menu_items FOR SELECT TO anon, authenticated USING (available = true);
CREATE POLICY "Public can view menu categories" ON public.menu_categories FOR SELECT TO anon, authenticated USING (true);