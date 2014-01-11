class SubjectEditType < Subject
  include BaseType

  permit :title
end