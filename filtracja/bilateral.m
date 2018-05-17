function data_filtered = bilateral(data, local_window, ro)
    FUNCTION = @(data_, local_window_, ro_)bilateral_local(data_,local_window,ro);
    data_filtered = colfilt(data, local_window, 'sliding', FUNCTION, local_window);
end